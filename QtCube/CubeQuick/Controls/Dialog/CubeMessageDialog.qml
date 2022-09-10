import QtQuick
import QtQuick.Controls

CubeDialogTemplate {
    id : control
    property alias text: messageText.text
    width: 320
    height: standardButtons === Dialog.NoButton ? messageText.implicitHeight+80
           :  messageText.implicitHeight+72+footer.implicitHeight
    title: "MessageDialog"
    contentItem: Item{
        Text {
            id:messageText
            anchors.fill: parent
            anchors.centerIn: parent
            color: Material.theme === Material.Light ? "#808080" : "#DDDDDD"
            text: "Message: Hello World!"
            font: control.font
            wrapMode: Text.WrapAnywhere
            verticalAlignment: Text.AlignVCenter
        }
    }
}
