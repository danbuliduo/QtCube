import QtQuick
import QtQuick.Controls
import CubeAndroid.CoreX
import "qrc:/app/+MaterialInterface" as M
import "qrc:/app/android/+impl" as IMPL

M.QuickDemoPage {
    title: "AndroidSystemSensor"
    M.QuickDemoItem{ icolor: "#32DE84"}
    ListModel{
        id: listmodel
        ListElement{
            _title: "AcceleroMeter"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-android.svg"
        }
        ListElement{
            _title: "AmbientLightSensor"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-android.svg"
        }
        ListElement{
            _title: "AmbientTemperatureSensor"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-android.svg"
        }
        ListElement{
            _title: "Compass"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-android.svg"
        }
        ListElement{
            _title: "Gyroscope"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-android.svg"
        }
        ListElement{
            _title: "HumiditySensor"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-android.svg"
        }
        ListElement{
            _title: "LightSensor"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-android.svg"
        }
        ListElement{
            _title: "MagnetoMeter"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-android.svg"
        }
        ListElement{
            _title: "OrientationSensor"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-android.svg"
        }
        ListElement{
            _title: "PressureSensor"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-android.svg"
        }
        ListElement{
            _title: "ProximitySensor"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-android.svg"
        }
        ListElement{
            _title: "RotationSensor"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-android.svg"
        }
        ListElement{
            _title: "TiltSensor"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-android.svg"
        }
    }
    ObjectModel{
        id: objectmodel
        Component{
            M.QuickDemoView{
                IMPL.SystemSensorObject{
                    description: AndroidSystemSensor.getDescription(Sensor.AcceleroMeter)
                    imgUrl: "qrc:/res/jpg/sensors-coordinates2.jpg"
                    name: "加速度传感器"
                    onUpdate: {
                        text = "x轴: "+AndroidSystemSensor.getAccelero(Sensor.X).toFixed(6)+"\n"
                                +"y轴: "+AndroidSystemSensor.getAccelero(Sensor.Y).toFixed(6)+"\n"
                                +"z轴: "+AndroidSystemSensor.getAccelero(Sensor.Z).toFixed(6)+"\n"
                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
                IMPL.SystemSensorObject{
                    description: AndroidSystemSensor.getDescription(Sensor.AmbientTemperatureSensor)
                    imgUrl: "qrc:/res/jpg/sensors-coordinates2.jpg"
                    name: "环境光亮传感器"
                    onUpdate: {

                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
                IMPL.SystemSensorObject{
                    description: AndroidSystemSensor.getDescription(Sensor.AmbientTemperatureSensor)
                    imgUrl: "qrc:/res/jpg/sensors-coordinates2.jpg"
                    name: "环境温度传感器"
                    onUpdate: {

                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
                IMPL.SystemSensorObject{
                    description: AndroidSystemSensor.getDescription(Sensor.Compass)
                    imgUrl: "qrc:/res/jpg/sensors-coordinates2.jpg"
                    name: "电子罗盘"
                    onUpdate: {
                        text = "方位角: "+AndroidSystemSensor.getCompass().toFixed(6)
                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
                IMPL.SystemSensorObject{
                    description: AndroidSystemSensor.getDescription(Sensor.Gyroscope)
                    imgUrl: "qrc:/res/jpg/sensors-coordinates3.jpg"
                    name: "陀螺仪"
                    onUpdate: {
                        text = "x轴: "+AndroidSystemSensor.getGyroscope(Sensor.X).toFixed(6)+"\n"
                                +"y轴: "+AndroidSystemSensor.getGyroscope(Sensor.Y).toFixed(6)+"\n"
                                +"z轴: "+AndroidSystemSensor.getGyroscope(Sensor.Z).toFixed(6)+"\n"
                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
                IMPL.SystemSensorObject{
                    description: AndroidSystemSensor.getDescription(Sensor.HumiditySensor)
                    imgUrl: "qrc:/res/jpg/sensors-coordinates2.jpg"
                    name: "湿度传感器"
                    onUpdate: {

                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
                IMPL.SystemSensorObject{
                    description: AndroidSystemSensor.getDescription(Sensor.LightSensor)
                    imgUrl: "qrc:/res/jpg/sensors-coordinates2.jpg"
                    name: "光强传感器"
                    onUpdate: {
                        text = "光照强度: "+AndroidSystemSensor.getLight().toFixed(6)+" lux\n"
                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
                IMPL.SystemSensorObject{
                    description: AndroidSystemSensor.getDescription(Sensor.MagnetoMeter)
                    imgUrl: "qrc:/res/jpg/sensors-coordinates2.jpg"
                    name: "电磁场传感器"
                    onUpdate: {
                        text = "x轴: "+AndroidSystemSensor.getMagneto(Sensor.X).toFixed(6)+"\n"
                                +"y轴: "+AndroidSystemSensor.getMagneto(Sensor.Y).toFixed(6)+"\n"
                                +"z轴: "+AndroidSystemSensor.getMagneto(Sensor.Z).toFixed(6)+"\n"
                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
                IMPL.SystemSensorObject{
                    description: AndroidSystemSensor.getDescription(Sensor.OrientationSensor)
                    imgUrl: "qrc:/res/jpg/sensors-sides.jpg"
                    name: "方向传感器"
                    onUpdate: {

                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
                IMPL.SystemSensorObject{
                    description: AndroidSystemSensor.getDescription(Sensor.PressureSensor)
                    imgUrl: "qrc:/res/jpg/sensors-coordinates2.jpg"
                    name: "大气压强传感器"
                    onUpdate: {

                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
                IMPL.SystemSensorObject{
                    description: AndroidSystemSensor.getDescription(Sensor.ProximitySensor)
                    imgUrl: "qrc:/res/jpg/sensors-coordinates2.jpg"
                    name:"近距离传感器"
                    onUpdate: {
                        if(AndroidSystemSensor.getProximity() === 0) {text = "距离状态: 靠近" }
                        else if(AndroidSystemSensor.getProximity() === 1){text = "距离状态: 远离"}
                        else{text = "距离状态: Error"}
                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
                IMPL.SystemSensorObject{
                    description: AndroidSystemSensor.getDescription(Sensor.RotationSensor)
                    imgUrl: "qrc:/res/jpg/sensors-rotation.jpg"
                    name: "旋转传感器"
                    onUpdate: {
                        text = "x轴: "+AndroidSystemSensor.getRotation(Sensor.X).toFixed(6)+"\n"
                                +"y轴: "+AndroidSystemSensor.getRotation(Sensor.Y).toFixed(6)+"\n"
                                +"z轴: "+AndroidSystemSensor.getRotation(Sensor.Z).toFixed(6)+"\n"
                    }
                }
            }
        }
        Component{
            M.QuickDemoView{
                IMPL.SystemSensorObject{
                    description: AndroidSystemSensor.getDescription(Sensor.TiltSensor)
                    imgUrl: "qrc:/res/jpg/sensors-coordinates2.jpg"
                    name: "倾斜传感器"
                    onUpdate: {

                    }
                }
            }
        }
    }
    Component.onCompleted: {
        AndroidSystemSensor.openAllTypeSensor()
    }
    Component.onDestruction: {
        AndroidSystemSensor.closeAllTypeSensor()
    }
}
