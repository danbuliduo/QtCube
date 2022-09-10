import QtQuick
import QtQuick.Controls
import "qrc:/app/+MaterialInterface" as M

Page {
    title: "CubeQuick.Effects"
    ListModel {
        id: listmodel
        ListElement{
            _title: "Effects"
            _name: "- 基础效果集 -"
            _icon: "qrc:/res/svg/icon-magic.svg"
            _version: "1.0"
            _introduction: "一些作用于UI组件的基本动画效果：SlidingEffect、FlipEffect、ZoomEffect、RotationEffect"
        }
        ListElement{
            _title: "MediaEffect"
            _name: "- 媒体效果 -"
            _icon: "qrc:/res/svg/icon-media.svg"
            _version: "1.0"
            _introduction: "基于媒体播放器的效果：AuduoOutputEffect"
        }
    }
    ObjectModel{
        id: objectmodel
        Component{ EffectsItem{} }
        Component{ MediaEffectItem{} }
    }
    M.DelegateListView{
        id:listview
        imgUrl: "qrc:/res/png/Qt6-QMLbook.png"
        model: listmodel
        delegate: M.DelegateItem{}
    }
}
