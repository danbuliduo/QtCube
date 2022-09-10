#pragma once

#include<QJniObject>
#include<QImage>
#include<android/bitmap.h>
#include<jni.h>
#include<QDebug>

QJniObject imageToAndroidBitmap(const QImage &img){
    QImage image = img.convertToFormat(QImage::Format_RGBA8888);
    qDebug()<<img;
    JNIEnv *env= new JNIEnv;
    QJniEnvironment e;
    AndroidBitmapInfo info;
    QJniObject config = QJniObject::getStaticObjectField(
                "android/graphics/Bitmap$Config",
                "ARGB_8888",
                "Landroid/graphics/Bitmap$Config;");
    QJniObject bitmap = QJniObject::callStaticObjectMethod(
                "android/graphics/Bitmap",
                "createBitmap",
                "(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;",
                img.width(), img.height(), config.object());
    qDebug()<<env;
    qDebug()<<"a";
    if (AndroidBitmap_getInfo(env, bitmap.object(), &info) < 0) return QJniObject();
     qDebug()<<"aa";
    if (info.format != ANDROID_BITMAP_FORMAT_RGBA_8888) return QJniObject();
     qDebug()<<"b";
    void *pixels ;
    if (AndroidBitmap_lockPixels(env, bitmap.object(), &pixels)<0) return QJniObject();
    if (info.stride == uint32_t(image.bytesPerLine())) {
        memcpy(pixels, image.constBits(), info.stride * info.height);
    } else {
        uchar *bmpPtr = static_cast<uchar *>(pixels);
        const unsigned width = std::min(info.width, (uint)image.width());
        const unsigned height = std::min(info.height, (uint)image.height());
        for (unsigned y = 0; y < height; y++, bmpPtr += info.stride)
            memcpy(bmpPtr, image.constScanLine(y), width);
    }
    if (AndroidBitmap_unlockPixels(env, bitmap.object()) <0) return QJniObject();
    return bitmap;
}
