import QtQuick
import Qt5Compat.GraphicalEffects

Item {
   id: control
   property real maskRadius: 0
   layer.enabled: true
   layer.effect: OpacityMask {
       maskSource: Rectangle {
           width: control.width
           height: control.height
           radius: control.maskRadius
       }
   }
}
