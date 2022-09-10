import QtQuick
import QtQuick.Controls.Material
import "qrc:/app/+MaterialInterface" as M

M.QuickDemoPage {
    title: "Effect - MediaEffect"
    M.QuickDemoItem{ }
    ListModel{
        id: listmodel
        ListElement{
            _title: "AuduoOutputEffect"
            _author: "Author:  TengMing"
            _version: "Version:  1.0"
            _itemicon: "qrc:/res/svg/icon-media.svg"
        }
    }
    ObjectModel{
        id: objectmodel
        Component{
            M.QuickDemoView{
                Item{

                }
            }
        }
    }
}
