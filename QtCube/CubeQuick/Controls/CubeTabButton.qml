import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

T.TabButton {
    id: control
    property bool animation: true
    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)
    padding: 8
    spacing: 4

    display: AbstractButton.TextUnderIcon
    font.capitalization:  Font.MixedCase

    icon.width: 24
    icon.height: 24
    icon.color:  down || checked ? Material.accentColor : "transparent"
    enabled: true
    onClicked:  if(control.animation){ animation.start()}

    contentItem: IconLabel {
        id: contentItem
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display
        icon: control.icon
        text: control.text
        font: control.font
        color: control.down || control.checked ? Material.accentColor : Material.foreground
        scale: control.pressed ? 0.75 : 1.0
        ScaleAnimator{
             id:animation
             target: contentItem
             duration: 500
             easing.type: Easing.OutBounce
             from: 0.75
             to: 1
         }
    }
    background: Ripple {
        implicitHeight: Material.touchTarget
        clip: true
        pressed: control.pressed
        anchor: control
        active: control.down || control.visualFocus || control.hovered
        color: Color.transparent(Material.accentColor, 0.12)
    }
}
