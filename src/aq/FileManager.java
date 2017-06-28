package aq;

import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.channels.FileChannel;

/**
 * Created by AqCxBoM on 2017/6/26.
 */

public class FileManager {
    public static File getResource(String filename){
        return new File("Resource\\" + filename);
    }
    public static void deleteFile(File file){
        if(!file.exists())
            return;
        if(file.isFile()){
            file.delete();
        }
        else{
            File[] fs = file.listFiles();
            for(File f: fs){
                deleteFile(f);
            }
            for(File f: fs){
                f.delete();
            }
        }
    }
    /**
     * 读取assets目录指定文件内容并通过解密方法解密，将结果释放到releaseFile指向的路径中
     * @param inFile 资源名
     * @param outFile 释放路径
     * @param decMethod 解密方法，public static byte[] dec(byte[] src)
     * @return
     */
    public static File copyFile(String inFile, String outFile, Method decMethod){
        try {
            //打开文件并读取所有内容到ByteArrayOutputStream流中
            InputStream is = new FileInputStream(inFile);
            ByteArrayOutputStream os = new ByteArrayOutputStream();
            byte[] buf = new byte[1024];
            int iRead;
            while((iRead = is.read(buf)) != -1){
                os.write(buf, 0, iRead);
            }
            // 调用解密方法去解密
            byte[] dec = decMethod != null ? (byte[]) decMethod.invoke(null, os.toByteArray()) : os.toByteArray();
            is.close();
            os.close();
            // 输出到指定路径中
            FileOutputStream fos = new FileOutputStream(new File(outFile));
            fos.write(dec);
            fos.close();
            return new File(outFile);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void copyFile(File from, File to){
      if(!from.exists())
        return;
        if(from.isDirectory()){
            if(to.exists())
                deleteFile(to);
            to.mkdir();
            File[] fs = from.listFiles();
            for(File f: fs)
                copyFile(f, new File(to, f.getName()));
        }
        else{
            FileInputStream fi = null;
            FileOutputStream fo = null;
            FileChannel in = null;
            FileChannel out = null;
            try {
                fi = new FileInputStream(from);
                fo = new FileOutputStream(to);
                in = fi.getChannel(); // 得到对应的文件通道
                out = fo.getChannel(); // 得到对应的文件通道
                in.transferTo(0, in.size(), out); // 连接两个通道，并从in通道读取写入out通道
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
            catch (IOException e){

            }
            finally {
              try {
                fi.close();
                fo.close();
                in.close();
                out.close();
              } catch (IOException e) {
                e.printStackTrace();
              }
            }
        }
    }
}
