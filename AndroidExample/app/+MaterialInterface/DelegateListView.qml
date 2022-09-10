import QtQuick
import QtQuick.Controls

ListView{
   id: root
   property url imgUrl
   anchors.top: parent.top
   anchors.bottom: parent.bottom
   anchors.topMargin: application.width > application.height ? 20 : 0
   width: parent.width
   orientation: application.width > application.height ? ListView.Horizontal : ListView.Vertical
   spacing: 16
   header: Item{
       visible: application.width < application.height
       width:  application.width > application.height ? 0  : root.width
       height: application.width*0.525//titleImage.height + 32
       Image {
           id: titleImage
           anchors.centerIn: parent
           width: parent.width - 40
           fillMode: Image.PreserveAspectFit
           source: root.imgUrl
           asynchronous: true
           cache: false
       }
   }
   footer: Item{width: 0.1; height: application.width > application.height ? 0 : 24}
}
