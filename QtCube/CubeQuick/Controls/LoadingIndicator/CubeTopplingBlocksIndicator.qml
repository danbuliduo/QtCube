import QtQuick
import QtQuick.Controls.Material

Control {
    id: control
    property int modelSum: 4
    property real modelSize: 16
    property color color: Material.accentColor
    property var colorArray : []
    property alias frequency: timer.interval
    implicitWidth: (modelSize+spacing )*modelSum - spacing + rightPadding + leftPadding
    implicitHeight: modelSize +topPadding + bottomPadding
    rightInset: rightPadding
    leftInset: leftPadding
    topInset: topPadding
    bottomInset: bottomPadding
    verticalPadding: 8
    horizontalPadding: modelSize
    spacing: 5

    contentItem: Row{
        spacing: control.spacing
        Repeater {
            id: repeater
            model: control.modelSum
            delegate: Rectangle{
                id:rect
                width: control.modelSize
                height: width
                radius: 2
                smooth: true
                color: index < control.colorArray.length ? control.colorArray[index] : control.color
                transformOrigin: Item.BottomRight
                SequentialAnimation {
                    id: animation
                    loops: Animation.Infinite
                    RotationAnimation {
                        target: rect
                        duration: control.frequency*4
                        from: 0
                        to: 90
                        easing.type: Easing.InOutQuint
                    }
                    PauseAnimation { duration: index*2*control.frequency }
                    RotationAnimation {
                        target: rect
                        duration: control.frequency*4
                        from: 90
                        to: 0
                        easing.type: Easing.InOutQuint
                    }
                    PauseAnimation { duration: (control.modelSum - index)*2*control.frequency }
                }
                function startAnimation() {
                    if(!animation.running) {
                       animation.start()
                    }
                }
            }
        }
        Timer{
            id:timer
            property int currentIndex: control.modelSum-1
            interval: 160
            repeat: true
            running: true
            onTriggered: {
                if(currentIndex !== -1){
                    repeater.itemAt(currentIndex).startAnimation()
                    currentIndex--
                }else{ stop() }
            }
        }
    }
}
