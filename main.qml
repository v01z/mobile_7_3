import QtQuick
//import QtQuick.Controls 2.15
import QtQuick.Controls

Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Homework 7 part 3")

    MouseArea{
        anchors.fill: parent
        acceptedButtons: Qt.RightButton
        onClicked: {
            customPopup.x = mouseX
            customPopup.y = mouseY
            customPopup.open()
        }
    }

    CustomCB{
        id: customCB
        anchors.centerIn: parent
        model: ListModel {
            id: model
            ListElement { text: "Banana" }
            ListElement { text: "Apple" }
            ListElement { text: "Coconut" }
        }
    }

    CustomPopup{
        id: customPopup
        x: 100
        y: 100
        width: 100
        height:  200
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        padding: 10

        Column{
            id: column
            anchors.fill: parent
            Label{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: middleLabel.top
                anchors.bottomMargin: 10
                height: 20
                text: "Close"
                MouseArea{
                    anchors.fill: parent
                    onClicked: customPopup.close()
                }
            }
            Label{
                id: middleLabel
                anchors.centerIn: parent
                height: 20
                text: "------"
            }
            Label{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: middleLabel.bottom
                anchors.topMargin: 10
                height: 20
                text: "Exit app"
                MouseArea{
                    anchors.fill: parent
                    onClicked: mainWindow.close()
                }
            }
        }

    }

}
