import QtQuick
import QtQuick.Controls

Control {
    id: control
    property alias itemCount: pathview.pathItemCount
    property alias model: pathview.model
    property alias delegate: pathview.delegate
    contentItem: PathView{
        id:pathview
        pathItemCount: 3
        //anchors.fill: parent
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        path: Path{
            startX: 0
            startY: pathview.height/2
            PathAttribute{name:"iconZ";value: 0}
            PathAttribute{name:"iconAngle";value: 70}
            PathAttribute{name:"iconScale";value: 0.6}

            PathLine{x:pathview.width/2;y:pathview.height/2}

            PathAttribute{name:"iconZ";value: 100}
            PathAttribute{name:"iconAngle";value: 0}
            PathAttribute{name:"iconScale";value: 1.0}

            PathLine{x:pathview.width;y:pathview.height/2}

            PathAttribute{name:"iconZ";value: 0}
            PathAttribute{name:"iconAngle";value: -70}
            PathAttribute{name:"iconScale";value: 0.6}

            PathPercent{value:1.0}
        }
    }
}
