import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

T.CheckBox {
    id: control
    property alias checkImage:checkImage
    property alias indicatorRect: indicatorItem
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                           implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                            implicitContentHeight + topPadding + bottomPadding,
                            implicitIndicatorHeight + topPadding + bottomPadding)
    spacing: 8
    padding: 8

    indicator: Rectangle {
        id: indicatorItem
        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding :
           control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        width: height
        height: 18
        color: "transparent"
        antialiasing : true
        border.color: !control.enabled ? Material.hintTextColor : checkState !== Qt.Unchecked
                                                      ? Material.accentColor : Material.secondaryTextColor
        border.width: control.checkState !== Qt.Unchecked ? width / 2 : 2
        radius: 2
        Behavior on border.width {
            NumberAnimation {
                duration: 100
                easing.type: Easing.OutCubic
            }
        }
        Behavior on border.color {
            ColorAnimation {
                duration: 100
                easing.type: Easing.OutCubic
            }
        }
        Image {
            id: checkImage
            anchors.fill: parent
            anchors.margins: 2.5 + indicatorItem.radius/7
            source: "qrc:/qt-project.org/imports/QtQuick/Controls/Material/images/check.png"
            fillMode: Image.PreserveAspectFit
            scale: control.checkState === Qt.Checked ? 1 : 0
            Behavior on scale { NumberAnimation { duration: 100 } }
        }
        states: [
            State {
                name: "checked"
                when: control.checkState === Qt.Checked
            },
            State {
                name: "partiallychecked"
                when: control.checkState === Qt.PartiallyChecked
            }
        ]
        transitions: Transition {
            SequentialAnimation {
                NumberAnimation {
                    target: indicatorItem
                    property: "scale"
                    to: 1 - 2 / indicatorItem.width
                    duration: 120
                }
                NumberAnimation {
                    target: indicatorItem
                    property: "scale"
                    to: 1
                    duration: 120
                }
            }
        }
        Ripple {
            id:indicatorRipple
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            z: -1
            width: parent.width+8
            height: parent.height+8
            anchor: control
            pressed: control.pressed
            active: control.down || control.visualFocus || control.hovered
            color:  Material.highlightedRippleColor
        }
    }
    contentItem: Text {
        id: contentText
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0
        text: control.text
        font: control.font
        color: Material.foreground
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }
}
