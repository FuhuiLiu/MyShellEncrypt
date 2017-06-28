.class public Laqcxbom/myshell2/FileManager;
.super Ljava/lang/Object;
.source "FileManager.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static releaseAssetsFile(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/reflect/Method;)Ljava/io/File;
    .locals 12
    .param p0, "ct"    # Landroid/content/Context;
    .param p1, "assetFile"    # Ljava/lang/String;
    .param p2, "releaseFile"    # Ljava/lang/String;
    .param p3, "decMethod"    # Ljava/lang/reflect/Method;

    .prologue
    .line 28
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 31
    .local v0, "am":Landroid/content/res/AssetManager;
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    .line 32
    .local v6, "is":Ljava/io/InputStream;
    new-instance v7, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v7}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 33
    .local v7, "os":Ljava/io/ByteArrayOutputStream;
    const/16 v8, 0x400

    new-array v1, v8, [B

    .line 35
    .local v1, "buf":[B
    :goto_0
    invoke-virtual {v6, v1}, Ljava/io/InputStream;->read([B)I

    move-result v5

    .local v5, "iRead":I
    const/4 v8, -0x1

    if-eq v5, v8, :cond_0

    .line 36
    const/4 v8, 0x0

    invoke-virtual {v7, v1, v8, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 47
    .end local v1    # "buf":[B
    .end local v5    # "iRead":I
    .end local v6    # "is":Ljava/io/InputStream;
    .end local v7    # "os":Ljava/io/ByteArrayOutputStream;
    :catch_0
    move-exception v3

    .line 48
    .local v3, "e":Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/io/IOException;->printStackTrace()V

    .line 54
    .end local v3    # "e":Ljava/io/IOException;
    :goto_1
    const/4 v8, 0x0

    :goto_2
    return-object v8

    .line 39
    .restart local v1    # "buf":[B
    .restart local v5    # "iRead":I
    .restart local v6    # "is":Ljava/io/InputStream;
    .restart local v7    # "os":Ljava/io/ByteArrayOutputStream;
    :cond_0
    if-eqz p3, :cond_1

    const/4 v8, 0x0

    const/4 v9, 0x1

    :try_start_1
    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v11

    aput-object v11, v9, v10

    invoke-virtual {p3, v8, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [B

    check-cast v8, [B

    move-object v2, v8

    .line 40
    .local v2, "dec":[B
    :goto_3
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    .line 41
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->close()V

    .line 43
    new-instance v4, Ljava/io/FileOutputStream;

    new-instance v8, Ljava/io/File;

    invoke-direct {v8, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v4, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 44
    .local v4, "fos":Ljava/io/FileOutputStream;
    invoke-virtual {v4, v2}, Ljava/io/FileOutputStream;->write([B)V

    .line 45
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 46
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_2

    .line 49
    .end local v1    # "buf":[B
    .end local v2    # "dec":[B
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .end local v5    # "iRead":I
    .end local v6    # "is":Ljava/io/InputStream;
    .end local v7    # "os":Ljava/io/ByteArrayOutputStream;
    :catch_1
    move-exception v3

    .line 50
    .local v3, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v3}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_1

    .line 39
    .end local v3    # "e":Ljava/lang/reflect/InvocationTargetException;
    .restart local v1    # "buf":[B
    .restart local v5    # "iRead":I
    .restart local v6    # "is":Ljava/io/InputStream;
    .restart local v7    # "os":Ljava/io/ByteArrayOutputStream;
    :cond_1
    :try_start_2
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v2

    goto :goto_3

    .line 51
    .end local v1    # "buf":[B
    .end local v5    # "iRead":I
    .end local v6    # "is":Ljava/io/InputStream;
    .end local v7    # "os":Ljava/io/ByteArrayOutputStream;
    :catch_2
    move-exception v3

    .line 52
    .local v3, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v3}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_1
.end method
