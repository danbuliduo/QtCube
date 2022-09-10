import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl
import CubeQuick.Controls

import "qrc:/app/settings"
import "qrc:/app/controls"
import "qrc:/app/views"
import "qrc:/app/effects"
import "qrc:/app/android"

ApplicationWindow {
    id: application
    property int statusbarHeight
    visible: true
    flags: Qt.Window | Qt.MaximizeUsingFullscreenGeometryHint
    width: Screen.desktopAvailableWidth + 1
    height: (Screen.height - Screen.desktopAvailableHeight) <= statusbarHeight ?
                Screen.height : Screen.desktopAvailableHeight
    Material.theme: AppSettings.theme
    Material.accent: AppSettings.accent
    header: ToolBar{
        id : toolBar
        visible : true
        Material.primary: Material.accentColor
        Item{
            height: 40
            width: parent.width
            anchors.bottom: parent.bottom
            ToolButton{
                id: menuBtn
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                icon.source: "qrc:/res/svg/icon-menu_h.svg"
                icon.color: "#FFFFFF"
                icon.height: 24
                icon.width: 24
                onClicked: {
                    AppActivities.clickedActivity(0)
                    drawer.open()
                }
            }
            Text{
                anchors.centerIn: parent
                color: "#FFFFFF"
                font.pixelSize: 18
                font.bold: true
                text: "QtCube - "+ AppConfigs.pagelistmode.get(tabBar.currentIndex).titleText
            }
            ToolButton{
                id: addBtn
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                icon.source: "qrc:/res/svg/icon-add.svg"
                icon.color: "#FFFFFF"
                icon.height: 24
                icon.width: 24
                onClicked:  menuPopop.visible ? menuPopop.close() : menuPopop.open()
                RotationAnimator {
                    id : addBtnAnimator
                    target: addBtn
                    duration: 100
                }
            }
        }
    }
    Drawer {
        id: drawer
        width: application.width > application.height ? application.width *0.36 : application.width*0.75
        height: parent.height
        Rectangle{
            width: 64
            height: parent.height
            color: Material.theme === Material.Light ? "#F0F0F0" : "#303030"
            Row{
                anchors.centerIn: parent
                rotation: -90
                spacing: application.width >application.height ? 8 : 32
                Image{
                    anchors.verticalCenter: parent.verticalCenter
                    sourceSize: Qt.size(32, 32)
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/res/svg/logo-qt.svg"
                }
                Text{
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                    font.pixelSize: 14
                    text: "THE FUTURE IS WRITTEN WITH QT"
                    color: "#41CD52"
                }
            }
        }
        Item{
            anchors.right: parent.right
            width: parent.width - 64
            height: parent.height
            Item{
                id : drawer_titleItem
                anchors.top: parent.top
                anchors.topMargin: application.statusbarHeight
                width: parent.width
                height: 120
                Row{
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 12
                    height: 48
                    spacing: 8
                    Image {
                        anchors.verticalCenter: parent.verticalCenter
                        width: 48
                        height: 48
                        source: "qrc:/res/png/Cube.png"
                    }
                    Text{
                        anchors.verticalCenter: parent.verticalCenter
                        color:  "#8A8A8A"
                        font.pixelSize: 32
                        font.bold: true
                        font.family: "Agency FB"
                        text: "Qt-Cube"
                    }
                }
                Image {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 16
                    fillMode: Image.PreserveAspectFit
                    width: 128
                    source: "qrc:/res/png/Built_with_Qt_RGB_logo_horizontal.png"
                    smooth: true
                }
                Rectangle{anchors.bottom: parent.bottom; width: parent.width; height: 0.5; color: "#D0D0D0"}
            }
            Flickable {
                anchors.top: parent.top
                anchors.topMargin: drawer_titleItem.height + application.statusbarHeight
                width: parent.width
                height: parent.height - anchors.topMargin - drawer_bottomItem.height
                contentWidth: width
                contentHeight: column_theme.height + column_color.height + column_sound.height + 20
                boundsMovement: Flickable.StopAtBounds
                boundsBehavior:  Flickable.StopAtBounds
                ScrollIndicator.vertical: ScrollIndicator { }
                clip: true
                Column{
                    id : column_theme
                    anchors.top: parent.top
                    width: parent.width
                    spacing: 4
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 40
                        spacing: 16
                        Image{
                            anchors.verticalCenter: parent.verticalCenter
                            source: "qrc:/res/svg/img-sun.svg"
                            sourceSize: Qt.size(24,24)
                        }
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            text: "主 题 模 式"
                            font.bold: true
                            font.pixelSize: 14
                            color: "#A0A0A0"
                        }
                    }
                    RadioDelegate{
                        width: parent.width
                        icon.source:  "qrc:/res/svg/icon-sun.svg"
                        icon.color: "#8A8A8A"
                        text: "浅色模式"
                        Material.foreground : "#8A8A8A"
                        checked: AppSettings.theme === Material.Light
                        onClicked: {
                            AppActivities.clickedActivity(1)
                            AppSettings.theme = Material.Light
                        }
                    }
                    RadioDelegate{
                         width: parent.width
                         icon.source: "qrc:/res/svg/icon-moon.svg"
                         icon.color: "#8A8A8A"
                         text: "深色模式"
                         Material.foreground : "#8A8A8A"
                         checked: AppSettings.theme === Material.Dark
                         onClicked: {
                             AppActivities.clickedActivity(1)
                             AppSettings.theme = Material.Dark
                         }
                    }
                    Rectangle{
                        width: parent.width
                        height: 0.4
                        color: "#D0D0D0"
                    }
                }
                Column{
                    id : column_color
                    anchors.top: column_theme.bottom
                    width: parent.width
                    spacing: 4
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 40
                        spacing: 16
                        Image{
                            anchors.verticalCenter: parent.verticalCenter
                            source: "qrc:/res/svg/img-colors.svg"
                            sourceSize: Qt.size(20,20)
                        }
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            text: "主 题 色 彩"
                            font.bold: true
                            font.pixelSize: 14
                            color: "#A0A0A0"
                        }
                    }
                    ComboBox {
                        id: comboBox
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: parent.width *0.8
                        currentIndex: AppSettings.accentID
                        font.bold: true
                        textRole: "name"
                        valueRole: "value"
                        Material.foreground: Material.accentColor
                        Material.background: "#FFFFFF"
                        Material.elevation: 0
                        model: AppConfigs.themelistmodel
                        delegate: ItemDelegate {
                            id: delegate
                            width: comboBox.width
                            font.bold: true
                            Material.accent: AppConfigs.themelistmodel.get(index).value
                            Material.foreground: AppConfigs.themelistmodel.get(index).value
                            text: AppConfigs.themelistmodel.get(index).name
                            Rectangle { height: parent.height; width: 6; color: Material.accentColor}
                            background: Rectangle {
                                implicitHeight: parent.Material.delegateHeight
                                color: "#FFFFFF"
                                Ripple {
                                    width: parent.width
                                    height: parent.height
                                    clip: true
                                    pressed: delegate.pressed
                                    anchor: delegate
                                    active: delegate.down || delegate.visualFocus || delegate.hovered
                                    color:Material.highlightedRippleColor
                                }
                            }
                            onClicked: {
                                AppActivities.clickedActivity(1)
                                AppSettings.accentID = index
                                AppSettings.accent = AppConfigs.themelistmodel.get(index).value
                            }
                        }
                   }
                   Rectangle{
                       width: parent.width
                       height: 0.4
                       color: "#D0D0D0"
                   }
                }
                Column{
                    id : column_sound
                    anchors.top: column_color.bottom
                    width: parent.width
                    Row{
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 40
                        spacing: 16
                        Image{
                            anchors.verticalCenter: parent.verticalCenter
                            source: "qrc:/res/svg/img-voice.svg"
                            sourceSize: Qt.size(24,24)
                        }
                        Text {
                            anchors.verticalCenter: parent.verticalCenter
                            text: "QtCube 音 效"
                            font.bold: true
                            font.pixelSize: 14
                            color: "#A0A0A0"
                        }
                    }
                    SwitchDelegate{
                        width: parent.width
                        font.bold: true
                        text: AppSettings.soundEffect ? "关闭QtCube音效" : "开启QtCube音效"
                        Material.foreground : "#8A8A8A"
                        checked: AppSettings.soundEffect
                        onClicked: {
                            AppSettings.soundEffect = !AppSettings.soundEffect
                            AppActivities.clickedActivity(1)
                        }
                    }
                }
            }
            Item{
                id: drawer_bottomItem
                anchors.bottom: parent.bottom
                width: parent.width
                height: 24
                Rectangle{width: parent.width; height: 0.4; color: "#D0D0D0"}
                Text{
                    anchors.centerIn: parent
                    color:  "#808080"
                    font.pixelSize: 12
                    font.bold: true
                    text: "Version: "+Application.version
                }
            }
        }

        Rectangle{
            width: parent.width
            height: application.statusbarHeight
            color: Qt.rgba(0,0,0,0.2)
        }
    }
    Popup{
        id: menuPopop
        x : header.width - width - addBtn.rightPadding
        y : 16
        horizontalPadding: 0
        verticalPadding: 20
        width: 150
        height: 200
        enter: Transition {
            PropertyAnimation {
                duration: 500; property: "scale";
                from: 0.0; to:1.0;
                easing.type: Easing.OutBounce;
            }
        }
        exit: Transition {
            NumberAnimation {
                duration: 500 ; property: "opacity";
                from: 1.0; to: 0.0;
                easing.type: Easing.OutCubic
            }
        }
        Column{
            anchors.fill: parent
            ItemDelegate{
                width: parent.width
                text: "关于QtCube"
                icon.source: "qrc:/res/svg/logo-cube.svg"
                icon.color: "transparent"
               // onClicked:
            }
            ItemDelegate{
                width: parent.width
                text: "前往Qt官网"
                icon.source: "qrc:/res/svg/logo-qt.svg"
                icon.height: 18
                icon.color: "transparent"
                onClicked: Qt.openUrlExternally(AppConfigs.qtURL)
            }
            ItemDelegate{
                width: parent.width
                text: "GitHub仓库"
                icon.source: "qrc:/res/svg/logo-github.svg"
                icon.color: "transparent"
                onClicked: Qt.openUrlExternally(AppConfigs.githubURL)
            }
            ItemDelegate{
                width: parent.width
                text: "湖北民族大学"
                icon.source: "qrc:/res/svg/logo-hbmz.svg"
                icon.color: "transparent"
                onClicked: Qt.openUrlExternally(AppConfigs.hbmzURL)
            }
        }
        background: CubeElevationRectangle {
            elevation: 12
            radius: 8
            Canvas{
                property color fillcolor: Material.dialogColor
                onFillcolorChanged: requestPaint()
                x: parent.width - addBtn.width
                y: - 12
                width: 24
                height: 12
                onPaint: {
                    var ctx = getContext("2d");
                    ctx.clearRect(0,0,width,height);
                    ctx.beginPath();
                    ctx.moveTo(0, 12);
                    ctx.lineTo(12,0);
                    ctx.lineTo(24,12);
                    ctx.fillStyle = fillcolor
                    ctx.fill();
                }
            }
        }
        onAboutToHide: {
            addBtnAnimator.from = 45
            addBtnAnimator.to = 0
            addBtnAnimator.start()
        }
        onAboutToShow: {
            AppActivities.clickedActivity(2)
            addBtnAnimator.from = 0
            addBtnAnimator.to = 45
            addBtnAnimator.start()
        }
    }
    StackView{
        id: stackview
        anchors.fill: parent
        initialItem:  component_main
        Component{
            id: component_main
            SwipeView{
                currentIndex: tabBar.currentIndex
                interactive: false
                AndroidPage{ visible: tabBar.currentIndex === 0}
                ControlsPage{ visible: tabBar.currentIndex === 1}
                EffectsPage{ visible: tabBar.currentIndex === 2}
                ViewsPage{ visible: tabBar.currentIndex === 3}
            }
        }
    }
    footer: CubeTabBar{
        id: tabBar
        contentHeight: 50
        Material.elevation: 2
        Material.accent: Material.theme === Material.Light ?
                             AppSettings.accent : Qt.lighter(AppSettings.accent, 1.618)
        Material.foreground : "#8A8A8A"
        Repeater {
            model : AppConfigs.pagelistmode
            CubeTabButton {
               icon.source: iconUrl
               icon.color:  down || checked ? Material.accentColor : Material.foreground
               text: titleText
               onClicked: AppActivities.clickedActivity(3)
           }
        }
    }
    Component.onCompleted: {
        application.statusbarHeight = Screen.height - Screen.desktopAvailableHeight
        toolBar.contentHeight = 40 +application.statusbarHeight
    }
    function stackviewPOP(){
        stackview.pop()
        footer.visible = true
        header.visible =true
    }
    function stackviewPUSH(Component){
        footer.visible = false
        header.visible = false
        stackview.push(Component)
    }
}
