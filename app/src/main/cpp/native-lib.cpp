#include <jni.h>
#include <string>
extern "C"{
#include "ffmpeg/include/libavcodec/avcodec.h"

#include "ffmpeg/include/libavformat/avformat.h"
#include "ffmpeg/include/libavutil/avutil.h"
}




extern "C" JNIEXPORT jstring JNICALL
Java_android_spport_myffmpegdemo_MainActivity_stringFromJNI(
        JNIEnv* env,
        jobject /* this */) {
    std::string hello = "Hello from C++";

    av_register_all();
    AVCodec *pCodec = av_codec_next(NULL);
    if(pCodec!= NULL)
    {
        switch (pCodec->type)
        {
            case AVMEDIA_TYPE_VIDEO:
                hello = " video type";
            case AVMEDIA_TYPE_AUDIO:
                hello = "audio type";
            default:
                hello = "default type";
        }
    }

    return env->NewStringUTF(hello.c_str());
}