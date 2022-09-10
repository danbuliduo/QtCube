import QtQuick
import QtQuick.Controls
import "qrc:/app/+MaterialInterface" as M

Page {
      title: "CubeQuick.Controls"
      ListModel {
          id: listmodel
          ListElement{
              _title: "Controls"
              _name: "- 基础组件集 -"
              _icon: "qrc:/res/svg/icon-component.svg"
              _version: "1.0"
              _introduction: "一些基本的组件和功能性小部件：Button、ElevationRectangle、GlowRectangle、TabBar、TabButton"
          }
          ListElement{
              _title: "Dialog"
              _name: "- 快捷对话框 -"
              _icon: "qrc:/res/svg/icon-message.svg"
              _version: "1.0"
              _introduction: "用户交互的对话框和功能性窗口：ColorDialog、FontDialog、MessageDialog"
          }
          ListElement{
              _title: "LoadingIndicator"
              _name: "- 忙碌指示器 -"
              _icon: "qrc:/res/svg/icon-loading.svg"
              _version: "1.0"
              _introduction: "进行耗时操作时的指示器：FlipBlockIndicator、PulseBlocksIndicator、QuickLoadingIndicator"
          }
          ListElement{
              _title: "ProgressBar"
              _name: "- 进度条-"
              _icon: "qrc:/res/svg/icon-progressbar.svg"
              _version: "1.0"
              _introduction: "显示任务进度的功能组件：QuickProgressBar、CircularProgressBar、SphericalProgressBar"
          }
      }
      ObjectModel {
          id: objectmodel
          Component{ ControlsItem{} }
          Component{ DialogItem{} }
          Component{ LoadingIndicatorItem{} }
          Component{ ProgressBarItem{} }
      }
      M.DelegateListView{
          id: listview
          imgUrl: "qrc:/res/png/Qt6-QMLbook.png"
          model: listmodel
          delegate: M.DelegateItem{}
      }
}
