pragma Singleton

import Qt.labs.settings
import QtQuick.Controls.Material
Settings {
    id: settings
    property bool soundEffect : true
    property int theme : 0
    property int accentID: 0
    property color accent: "#002FA7"
}
