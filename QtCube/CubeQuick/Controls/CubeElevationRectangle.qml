import QtQuick
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

Item {
    id: control
    property real elevation: 8
    property alias color: rect.color
    property alias radius: rect.radius
    property alias border: rect.border
    Rectangle{
        id : rect
        anchors.fill: parent
        color: Material.dialogColor
        layer.enabled: true
        layer.effect: ElevationEffect{ elevation: control.elevation }
    }
}
