import QtQuick

import MMaterial.UI as UI
import MMaterial.Controls.Inputs as Inputs
import MMaterial.Media as Media

Rectangle {
	id: root

	required property var rootItem
	required property Media.Icon leftIcon
	required property Item iconContainer

	property bool ignoreDisabledColoring: false
	property bool showPlaceholder: true

	radius: UI.Size.pixel8

	border {
		width: root.rootItem.type === TextField.Type.Outlined ? 1 : 0
		color: UI.Theme.text.primary
	}

	states: [
		//Filled
		State {
			name: "disabled-filled"
			when: (!root.rootItem.enabled && !root.ignoreDisabledColoring) && root.rootItem.type == TextField.Type.Filled
			PropertyChanges { target: root; color: UI.Theme.action.disabledBackground; border { color: UI.Theme.action.disabledBackground } }
			PropertyChanges { target: root.rootItem; color: UI.Theme.text.disabled; placeholderTextColor: UI.Theme.text.disabled }
		},
		State {
			name: "error-filled"
			when: !root.rootItem.acceptableInput && root.rootItem.type == TextField.Type.Filled
			PropertyChanges { target: root; color: UI.Theme.error.transparent.p8; border { color: UI.Theme.error.main } }
			PropertyChanges { target: root.rootItem; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.error.main }
		},
		State {
			name: "focused-filled"
			when: root.rootItem.focus && root.rootItem.type == TextField.Type.Filled
			PropertyChanges { target: root; color: UI.Theme.main.transparent.p16; border { color: UI.Theme.text.primary} }
			PropertyChanges { target: root.rootItem; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.text.primary }
		},
		State {
			name: "hovered-filled"
			when: root.rootItem.hovered && root.rootItem.type == TextField.Type.Filled
			PropertyChanges { target: root; color: UI.Theme.main.transparent.p16; border { color: UI.Theme.text.primary} }
			PropertyChanges { target: root.rootItem; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.text.disabled }
		},
		State {
			name: "normal-filled"
			when: root.rootItem.type == TextField.Type.Filled
			PropertyChanges { target: root; color: UI.Theme.main.transparent.p8; border { color: UI.Theme.action.disabledBackground} }
			PropertyChanges { target: root.rootItem; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.text.disabled }
		},

		//Outlined
		State {
			name: "disabled-outlined"
			when: (!root.rootItem.enabled && !root.ignoreDisabledColoring) && root.rootItem.type == TextField.Type.Outlined
			PropertyChanges { target: root; color: UI.Theme.background.paper; border { color: UI.Theme.action.disabledBackground } }
			PropertyChanges { target: root.rootItem; color: UI.Theme.text.disabled; placeholderTextColor: UI.Theme.text.disabled }
		},
		State {
			name: "error-outlined"
			when: !root.rootItem.acceptableInput && root.rootItem.type == TextField.Type.Outlined
			PropertyChanges { target: root; color: UI.Theme.background.paper; border { color: UI.Theme.error.main } }
			PropertyChanges { target: root.rootItem; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.error.main }
		},
		State {
			name: "focused-outlined"
			when: root.rootItem.activeFocus && root.rootItem.type == TextField.Type.Outlined
			PropertyChanges { target: root; color: UI.Theme.background.paper; border { color: UI.Theme.text.primary} }
			PropertyChanges { target: root.rootItem; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.text.primary }
		},
		State {
			name: "hovered-outlined"
			when: root.rootItem.hovered && root.rootItem.type == TextField.Type.Outlined
			PropertyChanges { target: root; color: UI.Theme.background.paper; border { color: UI.Theme.text.primary} }
			PropertyChanges { target: root.rootItem; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.text.disabled }
		},
		State {
			name: "normal-outlined"
			when: root.rootItem.type == TextField.Type.Outlined
			PropertyChanges { target: root; color: UI.Theme.background.paper; border { color: UI.Theme.action.disabledBackground} }
			PropertyChanges { target: root.rootItem; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.text.disabled }
		},

		//Standard
		State {
			name: "disabled"
			when: (!root.rootItem.enabled && !root.ignoreDisabledColoring)
			PropertyChanges { target: root; color: "transparent"; border { color: UI.Theme.action.disabledBackground } }
			PropertyChanges { target: root.rootItem; color: UI.Theme.text.disabled; placeholderTextColor: UI.Theme.text.disabled }
		},
		State {
			name: "error"
			when: !root.rootItem.acceptableInput
			PropertyChanges { target: root; color: "transparent"; border { color: UI.Theme.error.main } }
			PropertyChanges { target: root.rootItem; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.error.main }
		},
		State {
			name: "focused"
			when: root.rootItem.activeFocus
			PropertyChanges { target: root; color: "transparent"; border { color: UI.Theme.text.primary} }
			PropertyChanges { target: root.rootItem; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.text.primary }
		},
		State {
			name: "hovered"
			when: root.rootItem.hovered
			PropertyChanges { target: root; color: "transparent"; border { color: UI.Theme.text.primary} }
			PropertyChanges { target: root.rootItem; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.text.disabled }
		},
		State {
			name: "normal"
			when: true
			PropertyChanges { target: root; color: "transparent"; border { color: UI.Theme.action.disabledBackground} }
			PropertyChanges { target: root.rootItem; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.text.disabled }
		}
	]

	Rectangle {
		anchors.bottom: root.bottom

		width: root.width
		height: 1

		color: root.border.color
		visible: root.rootItem.type !== TextField.Type.Outlined && root.rootItem.type !== TextField.Type.Filled
	}

	Rectangle {
		id: _labelContainer

		scale: _label.scale

		height: root.border.width * 2
		width: _label.width
		visible: _label.text !== ""
		color: root.color
		radius: UI.Size.pixel8

		anchors {
			verticalCenter: _label.verticalCenter
			left: _label.left
			right: _label.right
			leftMargin: -UI.Size.pixel4
			rightMargin: UI.Size.pixel4
		}
	}

	UI.B2 {
		id: _label

		verticalAlignment: Qt.AlignVCenter
		horizontalAlignment: root.type === Inputs.TextField.Type.Outlined ? Qt.AlignHCenter : Qt.AlignLeft

		width: Math.min(implicitWidth + UI.Size.pixel8, root.rootItem.width)
		height: implicitHeight

		font.pixelSize: root.rootItem.font.pixelSize * 0.66
		text: root.rootItem.placeholderText
		color: root.rootItem.placeholderTextColor

		lineHeight: 1

		state: "foreground"
		states: [
			State {
				name: "foreground"
				when: root.showPlaceholder
				PropertyChanges { target: _labelContainer; opacity: 0.0; }
				PropertyChanges { target: root.iconContainer; anchors { topMargin: 0; } }
				PropertyChanges{
					target: _label;
					scale: 1.4;
					y: root.rootItem.height / 2 - _label.height / 2
					x: root.rootItem instanceof Inputs.ComboBox ?
						0 :
						(root.rootItem.type === Inputs.TextField.Type.Standard ?
							 (_label.font.pixelSize * _label.scale + (root.leftIcon.visible ? root.leftIcon.width + root.rootItem.leftPadding / 2 : 0)) :
							 (root.leftIcon.visible ? (root.leftIcon.width + root.rootItem.leftPadding ) : root.rootItem.leftPadding * 2))
				}
			},
			State {
				name: "background"
				when: true
				PropertyChanges { target: _labelContainer; opacity: 1.0; }
				PropertyChanges { target: root.iconContainer; anchors { topMargin: root.rootItem.type === TextField.Type.Outlined ? 0 : UI.Size.pixel16; } }
				PropertyChanges{
					target: _label;
					scale: 1;
					x:  root.type === Inputs.TextField.Type.Standard ? 0 : root.rootItem.leftPadding - (root.leftIcon.visible ? root.leftIcon.width + UI.Size.pixel8 : 0)
					y: root.rootItem.type === Inputs.TextField.Type.Outlined ? -height/2 : height/2;
				}
			}
		]

		transitions: [
			Transition {
				NumberAnimation { properties: "x,y,scale,opacity,anchors.topMargin"; duration: 100; easing.type: Easing.InOutQuad }
			}
		]
	}
}
