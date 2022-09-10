import QtQuick
import QtQuick.Controls

Control {
    id: control
    property alias model: repeater.model
    property alias delegate: repeater.delegate
    property alias interval: timer.interval
     property alias itemIndicatorDelegate: pageIndicator.delegate
    contentItem: SwipeView {
        id: swipeview
        currentIndex: pageIndicator.currentIndex
        Repeater{
            id: repeater
        }
    }
    PageIndicator {
        id: pageIndicator
        interactive: true
        count: swipeview.count
        currentIndex: swipeview.currentIndex
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Timer{
        id: timer
        running: swipeview.count > 1
        repeat: true
        interval: 2500
        onTriggered: {
            if(swipeview.currentIndex===swipeview.count - 1){
                swipeview.currentIndex=0
            }else{swipeview.currentIndex++}
        }
    }
}
