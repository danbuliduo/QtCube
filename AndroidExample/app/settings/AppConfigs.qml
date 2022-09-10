pragma Singleton

import QtQuick

QtObject {
    id: config
    property ListModel pagelistmode: ListModel{
        ListElement{ iconUrl :"qrc:/res/svg/icon-android.svg" ; titleText : "Android"}
        ListElement{ iconUrl :"qrc:/res/svg/icon-component.svg" ; titleText : "Controls"}
        ListElement{ iconUrl :"qrc:/res/svg/icon-magic.svg" ; titleText : "Effects"}
        ListElement{ iconUrl :"qrc:/res/svg/icon-view.svg" ; titleText : "Views"}
    }
    property ListModel themelistmodel: ListModel {
        ListElement { name: "克莱因蓝 - Klein"; value: "#002FA7"}
        ListElement { name: "勃艮第红 - Burgundy"; value: "#800020"}
        ListElement { name: "民  大  蓝 - HBMZBlue"; value:"#173782"}
        ListElement { name: "松    青 - Turquoise"; value: "#007272"}
        ListElement { name: "靛    紫 - IndigoViolet"; value: "#4B0082"}
    }
    property url qtURL: "https://www.qt.io"
    property url githubURL : "https://github.com/Q-Teng"
    property url hbmzURL : "https://hbmzu.edu.cn"
}
