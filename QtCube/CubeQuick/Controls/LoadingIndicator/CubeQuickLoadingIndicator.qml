import QtQuick
import QtQuick.Controls.Material

Control {
    id: control
    property int modelSum: 8
    property real contentSize: 32
    property real innerRadius: contentSize*0.36
    property color color: Material.accentColor
    property alias frequency: timer.interval
    implicitWidth: contentSize + leftPadding + rightPadding
    implicitHeight: contentSize + topPadding + bottomPadding
    rightInset: rightPadding
    leftInset: leftPadding
    topInset: topPadding
    bottomInset: bottomPadding
    padding: 8
    background: Item {
       id: backgroundItem
       height: contentSize
       width: contentSize
       Repeater{
           id:repeater
           model: control.modelSum
           delegate: Rectangle{
               property int thisRotation: (360 / control.modelSum) * index
               width: control.contentSize- control.innerRadius*2
               height: width * 4 / control.modelSum
               x: control.contentSize/2+control.innerRadius*Math.cos(((thisRotation *Math.PI) / 180.0))
               y: control.contentSize/2-control.innerRadius*Math.sin(((thisRotation *Math.PI) / 180.0)) - height /2
               radius: 0
               color: control.color
               opacity: ( index >= timer.currentIndex - 1 && index <= timer.currentIndex+1) ? 1 : 0.33
               transform: Rotation {
                   angle:  360 - thisRotation
                   origin { x: 0; y: height / 2 }
               }
              Behavior on opacity { NumberAnimation { duration: control.frequency * 1.4 } }
           }
       }
       Timer{
            id:timer
            property int currentIndex: control.modelSum
            interval: 640 / control.modelSum
            repeat: true
            running: control.visible
            onTriggered: {
                if (currentIndex === 0) {
                    currentIndex = control.modelSum
                }else {currentIndex-- }
            }
       }
    }
}
