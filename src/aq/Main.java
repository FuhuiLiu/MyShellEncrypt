package aq;

import java.io.File;

/**
 * Created by AqCxBoM on 2017/6/28.
 */
public class Main {

  public static void main(String[] args){
    try{
      if(args.length != 2) throw new Exception("Invalid argument");
      File inApk = new File(args[0]);
      if(!inApk.exists()) throw new Exception("Input apk file not exit");
      File outApk = new File(args[1]);
      File tmpFolder = new File("apkDecompile");

      //调用ShakaApktool解析输入apk
      log("start to decompile " + inApk.getAbsolutePath() + " to " + tmpFolder.getAbsolutePath());
      com.rover12421.shaka.cli.Main.main(new String[]{"d", "-s", inApk.getAbsolutePath(),
              "-o", tmpFolder.getAbsolutePath(), "-f", "-df"});

      //①剪贴 classes.dex到 assets/encrypt
      //②插入smali代码到 smali中
      //③解析 AndroidMainfest.xml
      // 获得 Application标签，插入 android:name="f8left.shell2.ProxyApplication"
      //  如果本来就有的，就把原先的android:name="..."的数据放入 metadata中
      //          <meta-data android:name="APPLICATION_CLASS_NAME" android:value="Old_Application" />
      //④重新打包

      // ① 复制classes.dex到assets/encrypt
      File assets = new File(tmpFolder, "assets");
      if(!assets.exists()) // 目标解析出来不存在assets目录则创建
        assets.mkdir();
      File classdex = new File(tmpFolder, "classes.dex");
      File encDex = new File(assets, "encrypt");
      log("start to encrypt classes.dex to assets/encrypt");
      FileManager.copyFile(classdex.getAbsolutePath(), encDex.getAbsolutePath(),
              Main.class.getDeclaredMethod("encrypt", byte[].class));
      // 删除旧dex文件
      FileManager.deleteFile(classdex);

      // ② 从Resource目录复制smali文件夹、lib文件夹所有内容到目标路径
      File smaliRes = FileManager.getResource("smali");
      log("start to copy shell smali file from " + smaliRes.getAbsolutePath());
      FileManager.copyFile(smaliRes, new File(tmpFolder, "smali"));
      File libRes = FileManager.getResource("lib");
      log("start to copy lib file from " + libRes.getAbsolutePath());
      FileManager.copyFile(libRes, new File(tmpFolder, "lib"));

      // ③ 修改manifest.xml中的application
      File manifest = new File(tmpFolder, "AndroidManifest.xml");
      log("start to fix AndroidManifest.xml");
      ManifestXml.modify(manifest);

      // ④ 打包回去
      log("start to backsmali from " + tmpFolder.getAbsolutePath() + " to " + outApk.getAbsolutePath());
      com.rover12421.shaka.cli.Main.main(new String[]{"b",
              tmpFolder.getAbsolutePath(),                        //decode inApk
              "-o",outApk.getAbsolutePath(),"-f"                   //to tmpFolder
      });
    }
    catch(Exception e){
      System.out.println(e);
      _USAGE();
    }

    }
  public static byte[] encrypt(byte[] b){
    return b;
  }
  private static void log(Object str){
    System.out.println(str);
  }
  private static void _USAGE(){
    System.out.println("FAndroidShell");
    System.out.println("    inApkFile outApkFile");
    System.out.println("        by AQCXBOM");
    System.out.println("        2017.06.28");
  }
}
