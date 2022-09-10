import QtQuick
import QtQuick.Controls.Material
import Qt5Compat.GraphicalEffects

Control {
    id: control
    property real contentSize: 40
    property color color: Material.accentColor
    property alias headerVisible: headerRect.visible
    property alias duration: animation.duration
    property alias gradient: background.gradient
    implicitWidth: contentSize + leftPadding + rightPadding
    implicitHeight: contentSize + topPadding + bottomPadding
    rightInset: rightPadding
    leftInset: leftPadding
    topInset: topPadding
    bottomInset: bottomPadding
    padding: 4
    smooth: true
    background: ConicalGradient {
        id: background
        width: rect.width
        height: rect.height
        source: rect
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(control.color.r,control.color.g,control.color.b,0.33) }
            GradientStop { position: 1.0; color: control.color }
        }
        Rectangle {
            id: headerRect
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            width: rect.border.width
            height: width
            radius: width / 2
            color: control.color
        }
        RotationAnimation on rotation {
            id:animation
            loops: Animation.Infinite
            running: control.visible
            from: 0
            to: 360
            duration: 1000
        }
    }
    contentItem: Rectangle {
         id: rect
         width: contentSize
         height: contentSize
         color: "transparent"
         radius: width / 2
         border.width: width *0.15
         visible: false
     }
}
