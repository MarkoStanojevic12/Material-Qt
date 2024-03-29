import QtQuick 
import QtQuick.Layouts

import MMaterial

RowLayout {
    default property alias container: _grid.data
    property alias title: _title
    property alias grid: _grid

    Layout.topMargin: Size.pixel40
    Layout.preferredWidth: parent.width

    spacing: Size.pixel20

    Overline {
        id: _title

        Layout.alignment: Qt.AlignLeft | Qt.AlignTop
        Layout.topMargin: Size.pixel10
        Layout.maximumWidth: 120 * Size.scale
        Layout.minimumWidth: Size.pixel10
        Layout.preferredWidth: Window.width * 0.08
        Layout.rightMargin: 20 * Size.scale

        color: Theme.text.disabled
        font.capitalization: Font.AllUppercase
        visible: Window.width > 440
    }

    GridLayout {
        id: _grid

        Layout.fillWidth: true
        Layout.preferredHeight: childrenRect.height

        columns: Window.width > 1300 * Size.scale ? 6 : (Window.width > 900 * Size.scale ? 3 : (Window.width > 500 * Size.scale ? 2 : 1))

        rowSpacing: Size.pixel40
        columnSpacing: Size.pixel40
    }

    Item { Layout.fillWidth: true; }
}
