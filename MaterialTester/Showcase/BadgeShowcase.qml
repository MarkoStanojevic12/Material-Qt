import QtQuick 
import QtQuick.Layouts

import MMaterial

Item {
    objectName: "Badge"

    ColumnLayout {
        anchors.fill: parent

        H6 { text: qsTr("Number") }

        GridLayout {
            id: numberBadgeGrid

            Layout.topMargin: Size.pixel24
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 100 * Size.scale

            columns: Size.format == Size.Format.Extended ? 7 : 4

            rowSpacing: Size.pixel40
            columnSpacing: Size.pixel40

            Badge {
                accent: Theme.primary
                type: Badge.Type.Number
                onClicked: quantity = 0
            }

            Badge {
                accent: Theme.secondary
                type: Badge.Type.Number

                onClicked: quantity = 0
            }

            Badge {
                accent: Theme.info
                type: Badge.Type.Number

                onClicked: quantity = 0
            }

            Badge {
                accent: Theme.success
                type: Badge.Type.Number

                onClicked: quantity = 0
            }

            Badge {
                accent: Theme.warning
                type: Badge.Type.Number

                onClicked: quantity = 0
            }

            Badge {
                accent: Theme.error
                type: Badge.Type.Number

                onClicked: quantity = 0
            }

            Badge {
                accent: Theme.success
                type: Badge.Type.Number

                onClicked: quantity = 0
            }

            Badge {
                accent: Theme.error
                type: Badge.Type.Number
                quantity: 1

                onClicked: quantity = 0
            }

            Badge {
                accent: Theme.error
                type: Badge.Type.Number
                quantity: 1500
                maxQuantity: 99

                onClicked: quantity = 0
            }

            Badge {
                accent: Theme.error
                type: Badge.Type.Number
                quantity: 1500
                maxQuantity: 999

                onClicked: quantity = 0
            }
        }

        H6 {
            Layout.topMargin: Size.pixel48

            text: qsTr("Dot")
        }

        GridLayout {
            id: dotBadgeGrid

            Layout.topMargin: Size.pixel24
            Layout.preferredWidth: parent.width

            columns: Size.format == Size.Format.Extended ? 7 : 4

            rowSpacing: Size.pixel40
            columnSpacing: Size.pixel40

            Badge {
                accent: Theme.primary

                onClicked: quantity = 0
            }

            Badge {
                accent: Theme.secondary

                onClicked: quantity = 0
            }

            Badge {
                accent: Theme.info

                onClicked: quantity = 0
            }

            Badge {
                accent: Theme.success

                onClicked: quantity = 0
            }

            Badge {
                accent: Theme.warning

                onClicked: quantity = 0
            }

            Badge {
                accent: Theme.error

                onClicked: quantity = 0
            }

            Badge {
                accent: Theme.success

                onClicked: quantity = 0
            }
        }

        Item { Layout.fillHeight: true; }
    }
}
