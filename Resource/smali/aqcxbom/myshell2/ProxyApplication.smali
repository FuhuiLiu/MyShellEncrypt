.class public Laqcxbom/myshell2/ProxyApplication;
.super Landroid/app/Application;
.source "ProxyApplication.java"


# static fields
.field private static final appKey:Ljava/lang/String; = "APPLICATION_CLASS_NAME"


# instance fields
.field private OdexPath:Ljava/lang/String;

.field private final TAG:Ljava/lang/String;

.field private cachePath:Ljava/lang/String;

.field private libPath:Ljava/lang/String;

.field private srcDex:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 24
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 25
    const-string v0, "AqCxBoM"

    iput-object v0, p0, Laqcxbom/myshell2/ProxyApplication;->TAG:Ljava/lang/String;

    return-void
.end method

.method public static decMethod([B)[B
    .locals 0
    .param p0, "in"    # [B

    .prologue
    .line 170
    return-object p0
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 15
    .param p1, "base"    # Landroid/content/Context;

    .prologue
    .line 132
    invoke-super/range {p0 .. p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V

    .line 133
    const-string v8, ".fshell"

    const/4 v9, 0x0

    invoke-virtual {p0, v8, v9}, Laqcxbom/myshell2/ProxyApplication;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    .line 134
    .local v0, "cache":Ljava/io/File;
    const-string v8, ".fodex"

    const/4 v9, 0x0

    invoke-virtual {p0, v8, v9}, Laqcxbom/myshell2/ProxyApplication;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Laqcxbom/myshell2/ProxyApplication;->OdexPath:Ljava/lang/String;

    .line 135
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Laqcxbom/myshell2/ProxyApplication;->cachePath:Ljava/lang/String;

    .line 136
    invoke-virtual {p0}, Laqcxbom/myshell2/ProxyApplication;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v8

    iget-object v8, v8, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    iput-object v8, p0, Laqcxbom/myshell2/ProxyApplication;->libPath:Ljava/lang/String;

    .line 137
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Laqcxbom/myshell2/ProxyApplication;->cachePath:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "/decrypt.dex"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Laqcxbom/myshell2/ProxyApplication;->srcDex:Ljava/lang/String;

    .line 140
    :try_start_0
    const-string v8, "encrypt"

    iget-object v9, p0, Laqcxbom/myshell2/ProxyApplication;->srcDex:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    const-string v11, "decMethod"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Class;

    const/4 v13, 0x0

    const-class v14, [B

    aput-object v14, v12, v13

    invoke-virtual {v10, v11, v12}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    invoke-static {p0, v8, v9, v10}, Laqcxbom/myshell2/FileManager;->releaseAssetsFile(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/reflect/Method;)Ljava/io/File;

    move-result-object v3

    .line 141
    .local v3, "decFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_0

    .line 142
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z

    .line 144
    :cond_0
    const-string v8, "android.app.ActivityThread"

    const-string v9, "currentActivityThread"

    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Class;

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-static {v8, v9, v10, v11}, Laqcxbom/myshell2/RefInvoke;->invokeStaticMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 148
    .local v1, "currentActivityThread":Ljava/lang/Object;
    invoke-virtual {p0}, Laqcxbom/myshell2/ProxyApplication;->getPackageName()Ljava/lang/String;

    move-result-object v6

    .line 149
    .local v6, "packageName":Ljava/lang/String;
    const-string v8, "android.app.ActivityThread"

    const-string v9, "mPackages"

    invoke-static {v8, v1, v9}, Laqcxbom/myshell2/RefInvoke;->getFieldObject(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/ArrayMap;

    .line 153
    .local v5, "mPackage":Landroid/util/ArrayMap;
    invoke-virtual {v5, v6}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/ref/WeakReference;

    .line 156
    .local v7, "wr":Ljava/lang/ref/WeakReference;
    new-instance v2, Ldalvik/system/DexClassLoader;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    iget-object v10, p0, Laqcxbom/myshell2/ProxyApplication;->OdexPath:Ljava/lang/String;

    iget-object v11, p0, Laqcxbom/myshell2/ProxyApplication;->libPath:Ljava/lang/String;

    const-string v8, "android.app.LoadedApk"

    .line 158
    invoke-virtual {v7}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v12

    const-string v13, "mClassLoader"

    .line 157
    invoke-static {v8, v12, v13}, Laqcxbom/myshell2/RefInvoke;->getFieldObject(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/ClassLoader;

    invoke-direct {v2, v9, v10, v11, v8}, Ldalvik/system/DexClassLoader;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 161
    .local v2, "dLoader":Ldalvik/system/DexClassLoader;
    const-string v8, "android.app.LoadedApk"

    const-string v9, "mClassLoader"

    invoke-virtual {v7}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v10

    invoke-static {v8, v9, v10, v2}, Laqcxbom/myshell2/RefInvoke;->setFieldOjbect(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 167
    .end local v1    # "currentActivityThread":Ljava/lang/Object;
    .end local v2    # "dLoader":Ldalvik/system/DexClassLoader;
    .end local v3    # "decFile":Ljava/io/File;
    .end local v5    # "mPackage":Landroid/util/ArrayMap;
    .end local v6    # "packageName":Ljava/lang/String;
    .end local v7    # "wr":Ljava/lang/ref/WeakReference;
    :goto_0
    return-void

    .line 162
    :catch_0
    move-exception v4

    .line 163
    .local v4, "e":Ljava/lang/NoSuchMethodException;
    invoke-virtual {v4}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    goto :goto_0

    .line 164
    .end local v4    # "e":Ljava/lang/NoSuchMethodException;
    :catch_1
    move-exception v4

    .line 165
    .local v4, "e":Ljava/io/IOException;
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0
.end method

.method public onCreate()V
    .locals 26

    .prologue
    .line 34
    const/4 v6, 0x0

    .line 37
    .local v6, "appClassName":Ljava/lang/String;
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Laqcxbom/myshell2/ProxyApplication;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v20

    invoke-virtual/range {p0 .. p0}, Laqcxbom/myshell2/ProxyApplication;->getPackageName()Ljava/lang/String;

    move-result-object v21

    const/16 v22, 0x80

    invoke-virtual/range {v20 .. v22}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v4

    .line 38
    .local v4, "ai":Landroid/content/pm/ApplicationInfo;
    iget-object v9, v4, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 39
    .local v9, "bundle":Landroid/os/Bundle;
    if-eqz v9, :cond_1

    const-string v20, "APPLICATION_CLASS_NAME"

    move-object/from16 v0, v20

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v20

    if-eqz v20, :cond_1

    .line 40
    const-string v20, "APPLICATION_CLASS_NAME"

    move-object/from16 v0, v20

    invoke-virtual {v9, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 53
    .end local v4    # "ai":Landroid/content/pm/ApplicationInfo;
    .end local v9    # "bundle":Landroid/os/Bundle;
    :goto_0
    const-string v20, "android.app.ActivityThread"

    const-string v21, "currentActivityThread"

    const/16 v22, 0x0

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    invoke-static/range {v20 .. v23}, Laqcxbom/myshell2/RefInvoke;->invokeStaticMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .line 59
    .local v10, "currentActivityThread":Ljava/lang/Object;
    const-string v20, "android.app.ActivityThread"

    const-string v21, "mBoundApplication"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v10, v1}, Laqcxbom/myshell2/RefInvoke;->getFieldObject(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v16

    .line 65
    .local v16, "mBoundApplication":Ljava/lang/Object;
    const-string v20, "android.app.ActivityThread$AppBindData"

    const-string v21, "info"

    move-object/from16 v0, v20

    move-object/from16 v1, v16

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Laqcxbom/myshell2/RefInvoke;->getFieldObject(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    .line 71
    .local v13, "loadedApkInfo":Ljava/lang/Object;
    const-string v20, "android.app.LoadedApk"

    const-string v21, "mApplication"

    const/16 v22, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-static {v0, v1, v13, v2}, Laqcxbom/myshell2/RefInvoke;->setFieldOjbect(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 74
    const-string v20, "android.app.ActivityThread"

    const-string v21, "mInitalApplication"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v10, v1}, Laqcxbom/myshell2/RefInvoke;->getFieldObject(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v18

    .line 82
    .local v18, "oldApplication":Ljava/lang/Object;
    const-string v20, "android.app.ActivityThread"

    const-string v21, "mAllApplications"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v10, v1}, Laqcxbom/myshell2/RefInvoke;->getFieldObject(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/ArrayList;

    .line 86
    .local v15, "mAllApplications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/Application;>;"
    move-object/from16 v0, v18

    invoke-virtual {v15, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 88
    const-string v20, "android.app.LoadedApk"

    const-string v21, "mApplicationInfo"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v13, v1}, Laqcxbom/myshell2/RefInvoke;->getFieldObject(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/content/pm/ApplicationInfo;

    .line 92
    .local v8, "appinfo_in_loadedApk":Landroid/content/pm/ApplicationInfo;
    const-string v20, "android.app.ActivityThread$AppBindData"

    const-string v21, "appInfo"

    move-object/from16 v0, v20

    move-object/from16 v1, v16

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Laqcxbom/myshell2/RefInvoke;->getFieldObject(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/pm/ApplicationInfo;

    .line 99
    .local v7, "appinfo_in_AppBindData":Landroid/content/pm/ApplicationInfo;
    iput-object v6, v8, Landroid/content/pm/ApplicationInfo;->className:Ljava/lang/String;

    .line 100
    iput-object v6, v7, Landroid/content/pm/ApplicationInfo;->className:Ljava/lang/String;

    .line 102
    const-string v20, "android.app.LoadedApk"

    const-string v21, "makeApplication"

    const/16 v22, 0x2

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Class;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    sget-object v24, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v24, v22, v23

    const/16 v23, 0x1

    const-class v24, Landroid/app/Instrumentation;

    aput-object v24, v22, v23

    const/16 v23, 0x2

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    const/16 v25, 0x0

    .line 105
    invoke-static/range {v25 .. v25}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v25

    aput-object v25, v23, v24

    const/16 v24, 0x1

    const/16 v25, 0x0

    aput-object v25, v23, v24

    .line 102
    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    move-object/from16 v3, v23

    invoke-static {v0, v1, v13, v2, v3}, Laqcxbom/myshell2/RefInvoke;->invokeMethod(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/app/Application;

    .line 108
    .local v5, "app":Landroid/app/Application;
    const-string v20, "android.app.ActivityThread"

    const-string v21, "mInitalApplication"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v1, v10, v5}, Laqcxbom/myshell2/RefInvoke;->setFieldOjbect(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 111
    const-string v20, "android.app.ActivityThread"

    const-string v21, "mProviderMap"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v10, v1}, Laqcxbom/myshell2/RefInvoke;->getFieldObject(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/util/HashMap;

    .line 114
    .local v17, "mProviderMap":Ljava/util/HashMap;
    invoke-virtual/range {v17 .. v17}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .line 115
    .local v12, "it":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_0

    .line 116
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    .line 117
    .local v19, "providerClientRecord":Ljava/lang/Object;
    const-string v20, "android.app.ActivityThread$ProviderClientRecord"

    const-string v21, "mLocalProvider"

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Laqcxbom/myshell2/RefInvoke;->getFieldObject(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    .line 120
    .local v14, "localProvider":Ljava/lang/Object;
    const-string v20, "android.content.ContentProvider"

    const-string v21, "mContext"

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-static {v0, v1, v14, v5}, Laqcxbom/myshell2/RefInvoke;->setFieldOjbect(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1

    .line 44
    .end local v5    # "app":Landroid/app/Application;
    .end local v7    # "appinfo_in_AppBindData":Landroid/content/pm/ApplicationInfo;
    .end local v8    # "appinfo_in_loadedApk":Landroid/content/pm/ApplicationInfo;
    .end local v10    # "currentActivityThread":Ljava/lang/Object;
    .end local v12    # "it":Ljava/util/Iterator;
    .end local v13    # "loadedApkInfo":Ljava/lang/Object;
    .end local v14    # "localProvider":Ljava/lang/Object;
    .end local v15    # "mAllApplications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/Application;>;"
    .end local v16    # "mBoundApplication":Ljava/lang/Object;
    .end local v17    # "mProviderMap":Ljava/util/HashMap;
    .end local v18    # "oldApplication":Ljava/lang/Object;
    .end local v19    # "providerClientRecord":Ljava/lang/Object;
    :catch_0
    move-exception v11

    .line 45
    .local v11, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v11}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    goto/16 :goto_0

    .line 123
    .end local v11    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v5    # "app":Landroid/app/Application;
    .restart local v7    # "appinfo_in_AppBindData":Landroid/content/pm/ApplicationInfo;
    .restart local v8    # "appinfo_in_loadedApk":Landroid/content/pm/ApplicationInfo;
    .restart local v10    # "currentActivityThread":Ljava/lang/Object;
    .restart local v12    # "it":Ljava/util/Iterator;
    .restart local v13    # "loadedApkInfo":Ljava/lang/Object;
    .restart local v15    # "mAllApplications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/Application;>;"
    .restart local v16    # "mBoundApplication":Ljava/lang/Object;
    .restart local v17    # "mProviderMap":Ljava/util/HashMap;
    .restart local v18    # "oldApplication":Ljava/lang/Object;
    :cond_0
    invoke-super/range {p0 .. p0}, Landroid/app/Application;->onCreate()V

    .line 124
    .end local v5    # "app":Landroid/app/Application;
    .end local v7    # "appinfo_in_AppBindData":Landroid/content/pm/ApplicationInfo;
    .end local v8    # "appinfo_in_loadedApk":Landroid/content/pm/ApplicationInfo;
    .end local v10    # "currentActivityThread":Ljava/lang/Object;
    .end local v12    # "it":Ljava/util/Iterator;
    .end local v13    # "loadedApkInfo":Ljava/lang/Object;
    .end local v15    # "mAllApplications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/Application;>;"
    .end local v16    # "mBoundApplication":Ljava/lang/Object;
    .end local v17    # "mProviderMap":Ljava/util/HashMap;
    .end local v18    # "oldApplication":Ljava/lang/Object;
    :cond_1
    return-void
.end method
