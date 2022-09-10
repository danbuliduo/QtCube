import QtQuick
import Qt5Compat.GraphicalEffects

Item {
   id: control
   property real radius: 0
   property bool transparentBorder: false
   layer.enabled: true
   layer.effect: FastBlur{
       width: control.width
       height: control.height
       source: control
       radius: control.radius
       transparentBorder: control.transparentBorder
   }
}
