import QtQuick
import QtQuick.Controls.Material

Control {
    id: control
    property real contentSize: 36
    property color color: Material.accentColor
    property alias duration: animation.duration
    implicitWidth: contentSize + leftPadding + rightPadding
    implicitHeight: contentSize + topPadding + bottomPadding
    rightInset: rightPadding
    leftInset: leftPadding
    topInset: topPadding
    bottomInset: bottomPadding
    padding: 4
    background: Rectangle{
        id: backgroundRect
        property real rotation : 0
        color: control.color
        antialiasing: true
        width: contentSize
        height: contentSize

        transform: Rotation {
            angle: control.visible ? backgroundRect.rotation : 0
            axis{
                x: animation.transStatus ? 0 : 1
                y: animation.transStatus ? 1 : 0
                z: 0
            }
            origin{
                x: control.contentSize / 2
                y: control.contentSize / 2
            }
        }
        RotationAnimation {
            id: animation
            property bool transStatus: false
            running: control.visible
            target: backgroundRect
            from: transStatus ? 0 : 180
            to: transStatus ? 180 : 0
            duration: 500
            onStopped: {
                transStatus =! transStatus
                if(control.visible){ animation.start() }
            }
        }
    }
}
