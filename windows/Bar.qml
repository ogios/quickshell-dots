import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland

import QtQuick.Layouts

import "root:/"

import "root:/components" as Components

import "root:/components/bar" as Bar

Variants {
    model: Quickshell.screens

    PanelWindow {
        id: bar

        property var modelData
        screen: modelData

        implicitWidth: Config.barWidth
        implicitHeight: Config.barHeight

        color: "transparent"

        WlrLayershell.layer: WlrLayer.Bottom
        exclusionMode: ExclusionMode.Ignore
        exclusiveZone: 0

        // property alias leftItems: container_left.data;
        // default property alias centerItems: container_center.data;
        // property alias rightItems: container_right.data;

        Component.onCompleted: {
            Config.barVerticalCenter = bar.verticalCenter;
        }

        anchors {
            left: true
            right: true
            // top: true
            bottom: true
        }

        margins {
            left: 100
            right: 100
            top: 0
            bottom: 10
        }

        Rectangle {
            // color: "black"
            id: container_left_rect
            height: parent.height

            color: "transparent"
            // border.color: "red"
            // border.width: 5

            anchors {
                left: parent.left
                right: container_center_rect.left
                verticalCenter: parent.verticalCenter
            }

            Row {
                id: container_left
                spacing: 10

                data: [
                    // Bar.Workspace {},
                    Components.FastMusicLine {}
                ]

                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Rectangle {
            id: container_center_rect
            color: "transparent"

            height: parent.height

            anchors {
                fill: parent
                leftMargin: container_left.implicitWidth
                rightMargin: container_right.implicitWidth + Config.clockSeperatorWidth * 4
            }

            Components.Separator {}

            // color: "transparent"
            // border.color: "green"
            // border.width: 5
        }

        Rectangle {
            id: container_right_rect
            height: parent.height

            color: "transparent"
            // border.color: "yellow"
            // border.width: 5

            anchors {
                left: container_center_rect.right
                right: parent.right
                verticalCenter: parent.verticalCenter
            }

            Row {
                id: container_right
                spacing: 10

                data: [
                    Bar.Clock {}
                ]

                anchors.right: parent.right
                anchors.rightMargin: 20
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}
