import QtQuick
import QtQuick.Controls.Material

SwipeView {
    id: control
    clip: true
    currentIndex: 0
    contentItem: ListView {
        id: listview
        anchors.fill: parent
        model: control.contentModel
        interactive: control.interactive
        currentIndex: control.currentIndex
        focus: control.focus
        spacing: control.spacing
        orientation: control.orientation
        snapMode: ListView.SnapOneItem
        boundsBehavior: Flickable.StopAtBounds
        highlightRangeMode: ListView.StrictlyEnforceRange
        preferredHighlightBegin: 0
        preferredHighlightEnd: 0
        highlightMoveDuration: 250
        maximumFlickVelocity: 4 * width
        Row {
            visible: control.count > 1
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 6
            Repeater {
                id: repeater
                property int _count: control.count
                model: control.count
                delegate: Rectangle {
                    property int _index
                    implicitWidth: 16
                    implicitHeight: 4
                    radius: 2
                    color: Material.foreground
                    opacity: _index === control.currentIndex ? 0.95 : 0.45
                    Behavior on opacity { OpacityAnimator { duration: 100 } }
                    Component.onCompleted: _index = --repeater._count
                }
            }
        }
    }
}
