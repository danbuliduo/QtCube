import QtQuick
import QtQuick.Controls
import "qrc:/app/android/+impl" as IMPL

Page {
   IMPL.AndroidDelegateItem{ }
   ListModel{
       id : listmodel
       ListElement{
           _title: "安卓·系统通知栏"
           _class: "AndroidNotification"
           _type: "普 通"
           _tcolor: "#BFBFBF"
           _color0: "#B721FF"
           _color1: "#21D4FD"
           _register: "[ 注册域: CubeAndroid.CoreX ]"
           _macro: "宏 - CUBE_NOTIFICATION"
           _introduction: "安卓系统通知栏在CubeAndroid.CoreX中注册为一般模式，支持安卓系统通知栏大图标、时间、进度条等设置"
       }
       ListElement{
           _title: "安卓·系统控制器"
           _class: "AndroidSystemController"
           _type: "单 例"
           _tcolor: "#FFA500"
           _color0: "#9EFBD3"
           _color1: "#45D4FB"
           _register: "[ 注册域: CubeAndroid.CoreX ]"
           _macro: "宏 - CUBE_SYSTEMCONTROLLER"
           _introduction: "安卓系统控制器在CubeAndroid.CoreX中注册为单例模式，支持安卓屏幕调节控制、震动器自定义震动、手电筒开关等安卓系统服务"
       }
       ListElement{
           _title: "安卓·系统传感器"
           _class: "AndroidSystemSensor"
           _type: "单 例"
           _tcolor: "#FFA500"
           _color0: "#FFC796"
           _color1: "#FF6B95"
           _register: "[ 注册域: CubeAndroid.CoreX ]"
           _macro: "宏 - CUBE_SYSTEMSENSOR"
           _introduction: "安卓系统控制器在CubeAndroid.CoreX中注册为单例模式，支持陀螺仪、光照传感器、加速度传感器、电磁传感器、旋转传感器 "
       }
   }
   ObjectModel{
       id: objectmodel
       Component{ NotificationItem{} }
       Component{ SystemControllerItem{} }
       Component{ SystemSensorItem{} }
   }
}
