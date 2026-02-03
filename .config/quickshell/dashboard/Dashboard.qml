import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "Dashboard"
    color: "transparent"
    ColumnLayout {
        anchors.fill: parent
        spacing: 6

        Rectangle {
            Layout.fillWidth: true
            height: 50
            color: col.surface
            Text {
                anchors.centerIn: parent
                text: "Welcome!"
                color: col.primary
                font.pixelSize: 20
            }
        }

        GridLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            columns: 2
            rowSpacing: 10
            columnSpacing: 10

            // System info card
            Card {
                Layout.fillWidth: true
                Layout.fillHeight: true
                headerText: "System Information"

                ColumnLayout {
                    anchors.fill: parent
                    Text {
                        text: "OS: " + Qt.platform.os
                    }
                    Text {
                        text: "Qt Version: " + QT_VERSION_STR
                    }
                }
            }

            Card {
                Layout.fillWidth: true
                Layout.fillHeight: true
                headerText: "CPU Usage"

                ColumnLayout {
                    anchors.fill: parent
                    ProgressBar {
                        Layout.fillWidth: true
                        value: 0.65
                    }
                    Text {
                        text: "65% used"
                    }
                }
            }

            Card {
                Layout.fillWidth: true
                Layout.fillHeight: true
                headerText: "Memory Usage"

                ColumnLayout {
                    anchors.fill: parent
                    ProgressBar {
                        Layout.fillWidth: true
                        value: 0.42
                    }
                    Text {
                        text: "42% used"
                    }
                }
            }

            Card {
                Layout.fillWidth: true
                Layout.fillHeight: true
                headerText: "Network"

                ColumnLayout {
                    anchors.fill: parent
                    Text {
                        text: "Upload: 1.2 MB/s"
                    }
                    Text {
                        text: "Download: 5.6 MB/s"
                    }
                }
            }
        }
    }

    component Card: Rectangle {
        property alias headerText: headerText.text

        color: "#ecf0f1"
        border.color: "#bdc3c7"
        border.width: 1
        radius: 5

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 10

            Text {
                id: headerText
                font.bold: true
                font.pixelSize: 16
            }

            Rectangle {
                Layout.fillWidth: true
                height: 1
                color: "#bdc3c7"
            }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }
}
