pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Templates as T

import MMaterial.UI as UI
import MMaterial.Controls as Controls

T.DialogButtonBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            (control.count === 1 ? implicitContentWidth * 2 : implicitContentWidth) + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)
    contentWidth: (contentItem as ListView).contentWidth // QTBUG-111283 blocks optional chaining + nullish coalescing

    padding: UI.Size.pixel12
    alignment: count === 1 ? Qt.AlignRight : undefined

    delegate: Controls.MButton {
        width: control.count === 1 ? control.availableWidth : implicitWidth
    }

    contentItem: ListView {
        implicitWidth: contentWidth
        model: control.contentModel
        spacing: control.spacing
        orientation: ListView.Horizontal
        boundsBehavior: Flickable.StopAtBounds
        snapMode: ListView.SnapToItem
    }

    background: Item {
        implicitHeight: 40
        x: 1; y: 1
        width: parent.width - 2
        height: parent.height - 2
    }
}
