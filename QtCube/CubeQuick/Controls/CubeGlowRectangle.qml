import QtQuick
import Qt5Compat.GraphicalEffects

Item{
    id: control
    property alias color: rect.color
    property alias radius: rect.radius
    property alias border: rect.border
    property alias cached: effect.cached
    property alias spread: effect.spread
    property alias glowColor: effect.color
    property alias glowRadius: effect.glowRadius
    property alias cornerRadius: effect.cornerRadius
    RectangularGlow{
        id: effect
        anchors.fill: rect
        cached: false
        spread: 0.2
        glowRadius: 0
        cornerRadius: rect.radius + glowRadius
    }
    Rectangle{
        id: rect
        anchors.fill: parent
    }
}
