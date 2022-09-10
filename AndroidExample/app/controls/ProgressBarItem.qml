import QtQuick
import QtQuick.Controls
import "qrc:/app/+MaterialInterface" as M

M.QuickDemoPage {
    title: "Controls - ProgressBar"
    M.QuickDemoItem{}
    ListModel{
        id: listmodel
        ListElement{
            _title: "ProgressBar"
            _author: "Author:  QT Team"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-progressbar.svg"
        }
    }
    ObjectModel{
        id: objectmodel
        Component{
            M.QuickDemoView{
                Item{
                    Column{
                        anchors.centerIn: parent
                        spacing: parent.height*0.2
                        ProgressBar {
                            anchors.horizontalCenter: parent.horizontalCenter
                            value: 0.0
                            Timer{
                                property bool progressStatus: true
                                running: true
                                repeat: true
                                interval: 20
                                onTriggered: {
                                    if(parent.value === 1.0 || parent.value  === 0.0){
                                        progressStatus = ! progressStatus
                                    }
                                    progressStatus ? parent.value += 0.01 : parent.value -=0.01
                                }
                            }
                        }
                        ProgressBar {
                            indeterminate: true
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }
            }
        }
    }
}
