import QtQuick
import QtQuick.Controls
import "qrc:/app/+MaterialInterface" as M

Page {
    title: "CubeQuick.Views"
    ListModel {
        id: listmodel
        ListElement{
            _title: "Views"
            _name: "- 基础视图集 -"
            _icon: "qrc:/res/svg/icon-view.svg"
            _version: "1.0"
            _introduction: "常用型基础的视图：GridView、ListView、ScrollView、SplitView、StackView、SwipeView"
        }
        ListElement{
            _title: "PathView"
            _name: "- 路径视图 -"
            _icon: "qrc:/res/svg/icon-path.svg"
            _version: "1.0"
            _introduction: "基于QML-PathView产生的高级视图：2DCarousel，3DCarousel"
        }
    }
    ObjectModel{
        id: objectmodel
        Component{ ViewsItem{} }
        Component{ PathViewItem{} }
    }
    M.DelegateListView{
        id: listview
        imgUrl: "qrc:/res/png/Qt6-QMLbook.png"
        model: listmodel
        delegate: M.DelegateItem{}
    }
}
