import QtQuick
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

CubeDialogTemplate{
    id: control
    property color currentColor : "#FF0000"
    readonly property real colorR: currentColor.r
    readonly property real colorG: currentColor.g
    readonly property real colorB: currentColor.b
    readonly property real colorA: currentColor.a
    width: 320
    height: 280
    title: "ColorDialog"
    standardButtons: Dialog.Ok | Dialog.Cancel
    contentItem: Item{
        Item{
            id : colorItem
            width: Math.min(control.width*0.56,control.height*0.56)
            height: Math.min(control.width*0.56,control.height*0.56)
            Rectangle {
                id: rect
                anchors.fill: parent
                color: "transparent"
                radius: width / 2
                border.width: width *0.1
                visible: false
            }
            ConicalGradient {
                width: rect.width
                height: rect.height
                angle: -90
                source: rect
                gradient: Gradient {
                    GradientStop { position: 0.000; color: Qt.rgba(1,0,0,1) }
                    GradientStop { position: 0.167; color: Qt.rgba(1,1,0,1) }
                    GradientStop { position: 0.333; color: Qt.rgba(0,1,0,1) }
                    GradientStop { position: 0.500; color: Qt.rgba(0,1,1,1) }
                    GradientStop { position: 0.667; color: Qt.rgba(0,0,1,1) }
                    GradientStop { position: 0.833; color: Qt.rgba(1,0,1,1) }
                    GradientStop { position: 1.000; color: Qt.rgba(1,0,0,1) }
                }
                MouseArea{
                    anchors.fill: parent
                    onMouseXChanged: function(mouse){
                        var angle = colorItem.getRotateAngle(mouse.x,mouse.y)
                        switchRect.x= colorItem.width/2 - Math.cos(angle *Math.PI/180) * (colorItem.width/2-switchRect.width/2)-switchRect.width/2
                        switchRect.y = colorItem.height/2 - Math.sin(angle * Math.PI/180) * (colorItem.height/2-switchRect.width/2)-switchRect.height/2
                        switchRect.rotation =angle
                        control.currentColor = colorItem.getRGBValue(angle )
                        rSlider.value = control.currentColor.r
                        gSlider.value = control.currentColor.g
                        bSlider.value = control.currentColor.b
                    }
                }
            }
            Rectangle{
                id: colorRect
                visible: false
                anchors.centerIn: parent
                width: parent.width*0.5
                height: parent.height*0.5
                color: control.currentColor
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        console.log("$$")
                    }
                }
            }
            ConicalGradient {
                anchors.fill: colorRect
                source: colorRect
                gradient: Gradient {
                    GradientStop { position: 0.000; color: Qt.rgba(1,(1+control.colorG)/2,(1+control.colorB),control.colorA) }
                    GradientStop { position: 0.125; color: control.currentColor }
                    GradientStop { position: 0.250; color: Qt.rgba(control.colorR/2,control.colorG/2,control.colorB/2,control.colorA) }
                    GradientStop { position: 0.375; color: Qt.rgba(0,0,0,control.colorA) }
                    GradientStop { position: 0.500; color: Qt.rgba(0,0,0,control.colorA) }
                    GradientStop { position: 0.625; color: Qt.rgba(0,0,0,control.colorA) }
                    GradientStop { position: 0.750; color: Qt.rgba(0.5,0.5,0.5,control.colorA) }
                    GradientStop { position: 0.825; color: Qt.rgba(1,1,1,control.colorA) }
                    GradientStop { position: 1.000; color: Qt.rgba(1,(1+control.colorG)/2,(1+control.colorB),control.colorA)  }
                }
            }
            Rectangle {
                id: switchRect
                y: (rect.height-height)/2
                width: rect.border.width
                height: width/2
                color: "transparent"
                antialiasing: true
                border.color: "#EEEEEE"
                border.width: 2
                transformOrigin: Item.Center
                Rectangle{
                    antialiasing: true
                    color: "transparent"
                    anchors.fill: parent
                    anchors.margins: -1
                    border.color: "#404040"
                }
            }
            function getRotateAngle (mouseX, mouseY) {
                var yPosOffset = mouseY - colorItem.width/2
                var xPosOffset = mouseX - colorItem.height/2
                var radian = Math.atan(Math.abs(yPosOffset / xPosOffset))
                if (xPosOffset < 0 && yPosOffset < 0) {
                    return radian * 180 / Math.PI
                } else if (xPosOffset === 0 && yPosOffset < 0) {
                    return 90
                } else if (xPosOffset > 0 && yPosOffset < 0) {
                    return 180 - radian * 180 / Math.PI
                } else if (xPosOffset > 0 && yPosOffset === 0) {
                    return 180
                } else if (xPosOffset > 0 && yPosOffset > 0) {
                    return 180 + radian * 180 / Math.PI
                } else if (xPosOffset === 0 && yPosOffset > 0) {
                    return 270
                } else if (xPosOffset < 0 && yPosOffset > 0) {
                    return 360 - radian * 180 / Math.PI
                }
            }
            function getRGBValue(angle){
                if(angle >=0 && angle <60){
                    return Qt.rgba(1,angle/60,0,alaphSlider.value)
                }else if(angle>=60 && angle <120){
                    return Qt.rgba(2-angle/60,1,0,alaphSlider.value)
                }else if(angle >=120 && angle <180){
                    return Qt.rgba(0,1,(angle/60)-2,alaphSlider.value)
                }else if(angle >=180 && angle <240){
                    return Qt.rgba(0,4-angle/60,1,alaphSlider.value)
                }else if(angle >=240 && angle <300){
                    return Qt.rgba(angle/60-4,0,1,alaphSlider.value)
                }else if(angle >=300 && angle <360){
                    return Qt.rgba(1,0,6-angle/60,alaphSlider.value)
                }
            }
        }
        Item{
            id: switchItem
            width: parent.width-colorItem.width
            height: parent.height
            anchors.right: parent.right
            Row{
                spacing: 8
                anchors.horizontalCenter: parent.horizontalCenter
                Rectangle{
                    width: 28
                    height: 28
                    color: control.currentColor
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text{
                    id: colorText
                    width: 64
                    text: control.currentColor
                    color: Material.theme === Material.Light ? "#404040" : "#DDDDDD"
                    font.pixelSize: 15
                    font.capitalization: Font.AllUppercase
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            Row{
                anchors.top: parent.top
                anchors.topMargin: 32
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: -20
                Column{
                    Text{
                         font.pixelSize: 12
                         color: Material.foreground
                         text: Math.round(255*rSlider.value)
                         anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Slider{
                        id : rSlider
                        Material.accent: "#ED1941"
                        orientation: Qt.Vertical
                        height: switchItem.height*0.66
                        value: 1.0
                        anchors.horizontalCenter: parent.horizontalCenter
                        onValueChanged: {

                        }
                    }
                    Text{
                        text :"R"
                        color: "#ED1941"
                        font.pixelSize: 12
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
                Column{
                    Text{
                         font.pixelSize: 12
                         color: Material.foreground
                         text: Math.round(255*gSlider.value)
                         anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Slider{
                        Material.accent: "#45B97C"
                        id : gSlider
                        orientation: Qt.Vertical
                        height: switchItem.height*0.66
                        value: 1.0
                        anchors.horizontalCenter: parent.horizontalCenter
                        onValueChanged: {
                        }
                    }
                    Text{
                         text :"G"
                         color : "#45B97C"
                         font.pixelSize: 12
                         font.bold: true
                         anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
                Column{
                    Text{
                         font.pixelSize: 12
                         color: Material.foreground
                         text: Math.round(255*bSlider.value)
                         anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Slider{
                        Material.accent: "#33A3DC"
                        id : bSlider
                        orientation: Qt.Vertical
                        height: switchItem.height*0.66
                        value: 1.0
                        anchors.horizontalCenter: parent.horizontalCenter
                        onValueChanged: {

                        }
                    }
                    Text{
                        text :"B"
                        color:"#33A3DC"
                        font.pixelSize: 12
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
                Column{
                    Text{
                         font.pixelSize: 12
                         color: Material.foreground
                         text: Math.round(255*alaphSlider.value)
                         anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Slider{
                        id : alaphSlider
                        Material.accent: "#D3D7D4"
                        orientation: Qt.Vertical
                        height: switchItem.height*0.66
                        value: 1.0
                        anchors.horizontalCenter: parent.horizontalCenter
                        onValueChanged: {
                            control.currentColor = Qt.rgba(control.currentColor.r,control.currentColor.g,control.currentColor.b,value)
                        }
                    }
                    Text{
                        text :"A"
                        color:"#D3D7D4"
                        font.pixelSize: 12
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }
    }
}
