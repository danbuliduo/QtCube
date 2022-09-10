import QtQuick
import QtQuick.Controls.Material

Control {
    id: control
    property int modelSum : 4
    property real modelWidth: 8
    property real modelHeight: 36
    property color color: Material.accentColor
    property var colorArray : []
    property alias frequency: timer.interval
    implicitWidth: (modelWidth+spacing)*modelSum - spacing + rightPadding + leftPadding
    implicitHeight: modelHeight +topPadding + bottomPadding
    rightInset: rightPadding
    leftInset: leftPadding
    topInset: topPadding
    bottomInset: bottomPadding
    verticalPadding: modelHeight*0.25
    horizontalPadding: 4
    spacing: 5

    contentItem: Row{
        spacing: control.spacing
        Repeater {
            id: repeater
            model: control.modelSum
            delegate: Rectangle {
                width: control.modelWidth
                height: control.modelHeight
                color: index < control.colorArray.length ? control.colorArray[index] : control.color
                transform: Scale {
                    id: rectScale
                    origin {  x: width / 2; y: height / 2; }
                }
                SequentialAnimation {
                    id: animation
                    loops: Animation.Infinite
                    NumberAnimation { target: rectScale; property: "yScale"; from: 1; to: 1.5; duration: timer.interval*3.2 }
                    NumberAnimation { target: rectScale; property: "yScale"; from: 1.5; to: 1; duration: timer.interval*3.2 }
                    PauseAnimation { duration: control.modelSum * timer.interval + 40 }
                }
                function startAnimation() {
                    if (!animation.running) {
                        animation.start()
                    }
                }
            }
        }
        Timer {
            id: timer
            property int currentIndex: 0
            interval: 100
            repeat: true
            running: control.visible
            onTriggered: {
                if(currentIndex !== control.modelSum) {
                    repeater.itemAt(currentIndex).startAnimation()
                    currentIndex++
                }else{ stop }
            }
        }
    }
}
