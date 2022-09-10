<p align="center">
    <img src="Image/QtCube.svg" alt="https://github.com/Q-Teng/"><br/>
    为Qt For Android开发者与设计师提供快捷灵活的工具组件与UI控件 
</p>
<p align="center">
    <img src="Image/lgplv3-147x51.png" >&emsp;
    <img src="Image/builtwidthqt.png" >
</p>

---

## APP演示界面
<p align="center">
    <img src="Image/phone-1.png" >
    <img src="Image/phone-3.png" >
</p>

---

## 功能模块
###  使用QMake进行添加
### [CubeAndroid]
-   <导入模块> —— 添加'include(../QtCube/CubeAndroid.pri)'到您的 .pro 文件
```qmake
include(../QtVista/CubeAndroid.pri)
```
-   <简要说明> —— CubeAndroid使用JNI开发并进行了QML注册, 您可以在QML中使用简单的Android工具进行开发

### [CubeQuick]
-   <导入模块> —— 添加'include(../QtCube/CubeQuick.pri)'到您的 .pro 文件
```qmake
include(../QtVista/CubeQuick.pri)
```
-   <简要说明> —— CubeQuick采用纯QML代码开发并且无任何第三方依赖,它包含了一系列快捷方便的UI组件供您设计

---

## 许可证书

QtCube使用 [LGPLv3 License](LICENSE.md). 您可以根据自由软件基金会发布的 GNU 宽松公共许可证的条款重新分发和/或修改它.
