import QtQuick 2.12
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import BackEnd 1.0

Window {
    id: mainWindow

    width: 1200
    height: 900
    minimumWidth: 1200
    minimumHeight: 900
    //color: "#252525"
    color: "#ffffff"
    visible: true
    title: qsTr("mySmartDictionary")


    Material.theme: Material.Dark
    Material.accent: Material.Green


    property int textSize: 18
    property int textSizeHeader: 20

    BackEnd {
        id: backEnd
    }

    StackLayout {
        id: stackLayout
        anchors.left: columnLayoutBasicOperations.right
        anchors.right: parent.right

        anchors.top: parent.top
        anchors.bottom: tabBar.top
        anchors.rightMargin: 10
        anchors.topMargin: 10
        anchors.bottomMargin: 0
        anchors.leftMargin: 10

        currentIndex: tabBar.currentIndex

        GroupBox {
            id: groupBoxFind

            width: 573
            height: 452
            /*
            anchors.left: parent.left
            anchors.bottom: parent.top
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottomMargin: 10
            anchors.leftMargin: 10
            anchors.topMargin: 10
            anchors.rightMargin: 10
            */
            title: qsTr("Find the word in the dictionary by match")

            TextField {
                id: textFieldFindWord

                color: "#000000"
                anchors.left: buttonFind.right
                anchors.right: parent.right
                anchors.top: parent.top
                font.pixelSize: 12
                placeholderText: "Type here..."
                anchors.leftMargin: 20
                anchors.topMargin: 0
                anchors.rightMargin: 0
            }

            Button {
                id: buttonFind

                text: qsTr("Find")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 0
                anchors.topMargin: 0

                onClicked: {
                    if (!switchDelegateBeginEnd.checked) {
                        backEnd.getMatchesBegin(textFieldFindWord.text)
                    } else {
                        backEnd.getMatchesEnd(textFieldFindWord.text)
                    }

                    textNumberOfWordsTotal.text = backEnd.getTotalNumberOfMatches()
                    textUniqueWords.text = backEnd.getNumberOfUniqueMatches()
                }
            }

            SwitchDelegate {
                id: switchDelegateBeginEnd

                height: 52
                text: qsTr("By match at the beginning(OFF) or at the end(ON) of the word")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: columnLayoutSortByFrequencyMatch.bottom
                anchors.topMargin: 20
                anchors.leftMargin: 0
                anchors.rightMargin: 9
            }

            ScrollView {
                id: scrollViewMatch

                anchors.top: switchDelegateBeginEnd.bottom
                anchors.topMargin: 20
                anchors.right: parent.right
                anchors.rightMargin: 0
                anchors.bottom: rowLayoutNumberOfWordsMatch.top
                clip: true
                activeFocusOnTab: false
                hoverEnabled: true
                anchors.bottomMargin: 30
                anchors.left: parent.left
                anchors.leftMargin: 0
                ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                ScrollBar.vertical.policy: ScrollBar.AlwaysOn

                Text {
                    id: textWordsThatWasFound

                    width: scrollViewMatch.width * 0.95
                    height: scrollViewMatch.height * 0.95
                    color: "#000000"
                    clip: false
                }
            }

            Button {
                id: buttonSortAlphabeticallyMatch

                width: 176
                height: 49
                text: qsTr("Sort alphabetically")
                anchors.left: parent.left
                anchors.top: buttonFind.bottom
                anchors.leftMargin: -5
                anchors.topMargin: 20

                onClicked: {
                    textWordsThatWasFound.text = backEnd.getMatchesSortedAlphabetically()
                }
            }

            ColumnLayout {
                id: columnLayoutSortByFrequencyMatch

                x: 215
                width: 325
                height: 98
                anchors.top: textFieldFindWord.bottom
                anchors.topMargin: 20
                Button {
                    id: buttonSortByFrequencyMatch

                    text: qsTr("Sort by frequency")
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 255
                    Layout.fillWidth: true

                    onClicked: {
                        if (radioDelegateAscendingMatch.checked) {
                            textWordsThatWasFound.text = backEnd.getMatchesSortedByFrequencyAsc()
                        } else {
                            textWordsThatWasFound.text = backEnd.getMatchesSortedByFrequencyDesc()
                        }
                    }
                }

                RowLayout {
                    id: rowLayoutAscDesc1

                    Layout.preferredHeight: 52
                    Layout.preferredWidth: 260

                    RadioDelegate {
                        id: radioDelegateAscendingMatch

                        text: qsTr("Ascending")
                        Layout.fillHeight: true
                        checked: true
                        Layout.fillWidth: true
                    }

                    RadioDelegate {
                        id: radioDelegateDescendingMatch

                        text: qsTr("Descending")
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                }
            }

            RowLayout {
                id: rowLayoutNumberOfWordsMatch

                y: 401
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.rightMargin: 0
                anchors.leftMargin: 0

                Label {
                    id: labelNumberOfUniqueWords

                    color: "#000000"
                    text: qsTr("Unique words:")
                }

                Text {
                    id: textUniqueWords

                    color: "#000000"
                    text: qsTr("0")
                    font.pixelSize: 12
                }

                Label {
                    id: labelNumberOfWordsMatch

                    color: "#000000"
                    text: qsTr("Total number of words:")
                }

                Text {
                    id: textNumberOfWordsTotal

                    color: "#000000"
                    text: qsTr("0")
                    font.pixelSize: 12
                }
            }
        }


        GroupBox {
            id: groupBoxSort

            y: 510
            width: 573
            height: 352
            /*
            anchors.left: parent.left
            anchors.bottom: parent.top
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.bottomMargin: 10
            anchors.leftMargin: 10
            anchors.topMargin: 10
            */
            anchors.rightMargin: 10
            title: qsTr("Sort words in the dictionary")

            Button {
                id: buttonSortAlphabetically

                width: 176
                height: 49

                text: qsTr("Sort alphabetically")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 0
                anchors.topMargin: 0

                onClicked: {
                    textWordsSorted.text = backEnd.getWordsSortedAlphabetically()
                }
            }

            ScrollView {
                id: scrollViewSort

                anchors.left: parent.left
                anchors.right: parent.right
                //anchors.top: columnLayoutSortByFrequency.bottom
                anchors.bottom: parent.bottom
                hoverEnabled: true
                anchors.bottomMargin: 20
                activeFocusOnTab: false
                anchors.leftMargin: 0
                anchors.rightMargin: 0
                clip: true
                anchors.topMargin: 0

                Text {

                    id: textWordsSorted

                    width: scrollViewSort.width * 0.95
                    height: scrollViewSort.height * 0.95
                    color: "#000000"
                    clip: false
                }
            }
            ColumnLayout {
                id: columnLayoutSortByFrequency

                x: 220
                y: 0
                width: 325
                height: 98

                Button {
                    id: buttonSortByFrequency

                    text: qsTr("Sort by frequency")
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 255

                    onClicked: {
                        if (radioDelegateAscending.checked) {
                            textWordsSorted.text = backEnd.getWordsSortedByFrequencyAsc()
                        } else {
                            textWordsSorted.text = backEnd.getWordsSortedByFrequencyDesc()
                        }
                    }
                }

                RowLayout {
                    id: rowLayoutAscDesc

                    Layout.preferredHeight: 52
                    Layout.preferredWidth: 260

                    RadioDelegate {
                        id: radioDelegateAscending

                        text: qsTr("Ascending")
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        checked: true
                    }

                    RadioDelegate {
                        id: radioDelegateDescending

                        text: qsTr("Descending")
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }
                }
            }
        }
    }
    /*
    GroupBox {
        id: groupBoxFind

        width: 573
        height: 452
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 22
        anchors.leftMargin: 610
        title: qsTr("Find the word in the dictionary by match")

        TextField {
            id: textFieldFindWord

            color: "#000000"
            anchors.left: buttonFind.right
            anchors.right: parent.right
            anchors.top: parent.top
            font.pixelSize: 12
            placeholderText: "Type here..."
            anchors.leftMargin: 20
            anchors.topMargin: 0
            anchors.rightMargin: 0
        }

        Button {
            id: buttonFind

            text: qsTr("Find")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 0
            anchors.topMargin: 0

            onClicked: {
                if (!switchDelegateBeginEnd.checked) {
                    backEnd.getMatchesBegin(textFieldFindWord.text)
                } else {
                    backEnd.getMatchesEnd(textFieldFindWord.text)
                }

                textNumberOfWordsTotal.text = backEnd.getTotalNumberOfMatches()
                textUniqueWords.text = backEnd.getNumberOfUniqueMatches()
            }
        }

        SwitchDelegate {
            id: switchDelegateBeginEnd

            height: 52
            text: qsTr("By match at the beginning(OFF) or at the end(ON) of the word")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: columnLayoutSortByFrequencyMatch.bottom
            anchors.topMargin: 20
            anchors.leftMargin: 0
            anchors.rightMargin: 9
        }

        ScrollView {
            id: scrollViewMatch

            anchors.top: switchDelegateBeginEnd.bottom
            anchors.topMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.bottom: rowLayoutNumberOfWordsMatch.top
            clip: true
            activeFocusOnTab: false
            hoverEnabled: true
            anchors.bottomMargin: 30
            anchors.left: parent.left
            anchors.leftMargin: 0
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            ScrollBar.vertical.policy: ScrollBar.AlwaysOn

            Text {
                id: textWordsThatWasFound

                width: scrollViewMatch.width * 0.95
                height: scrollViewMatch.height * 0.95
                color: "#000000"
                clip: false
            }
        }

        RowLayout {
            id: rowLayoutNumberOfWordsMatch

            y: 401
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.rightMargin: 0
            anchors.leftMargin: 0

            Label {
                id: labelNumberOfUniqueWords

                color: "#000000"
                text: qsTr("Unique words:")
            }

            Text {
                id: textUniqueWords

                color: "#000000"
                text: qsTr("0")
                font.pixelSize: 12
            }

            Label {
                id: labelNumberOfWordsMatch

                color: "#000000"
                text: qsTr("Total number of words:")
            }

            Text {
                id: textNumberOfWordsTotal

                color: "#000000"
                text: qsTr("0")
                font.pixelSize: 12
            }
        }

        Button {
            id: buttonSortAlphabeticallyMatch

            width: 176
            height: 49
            text: qsTr("Sort alphabetically")
            anchors.left: parent.left
            anchors.top: buttonFind.bottom
            anchors.leftMargin: -5
            anchors.topMargin: 20

            onClicked: {
                textWordsThatWasFound.text = backEnd.getMatchesSortedAlphabetically()
            }
        }

        ColumnLayout {
            id: columnLayoutSortByFrequencyMatch

            x: 215
            width: 325
            height: 98
            anchors.top: textFieldFindWord.bottom
            anchors.topMargin: 20
            Button {
                id: buttonSortByFrequencyMatch

                text: qsTr("Sort by frequency")
                Layout.preferredHeight: 40
                Layout.preferredWidth: 255
                Layout.fillWidth: true

                onClicked: {
                    if (radioDelegateAscendingMatch.checked) {
                        textWordsThatWasFound.text = backEnd.getMatchesSortedByFrequencyAsc()
                    } else {
                        textWordsThatWasFound.text = backEnd.getMatchesSortedByFrequencyDesc()
                    }
                }
            }

            RowLayout {
                id: rowLayoutAscDesc1

                Layout.preferredHeight: 52
                Layout.preferredWidth: 260

                RadioDelegate {
                    id: radioDelegateAscendingMatch

                    text: qsTr("Ascending")
                    Layout.fillHeight: true
                    checked: true
                    Layout.fillWidth: true
                }

                RadioDelegate {
                    id: radioDelegateDescendingMatch

                    text: qsTr("Descending")
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }

            }
        }
    }

    GroupBox {
        id: groupBoxSort

        y: 510
        width: 573
        height: 352
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 38
        anchors.leftMargin: 610
        title: qsTr("Sort words in the dictionary")

        Button {
            id: buttonSortAlphabetically

            width: 176
            height: 49

            text: qsTr("Sort alphabetically")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 0
            anchors.topMargin: 0

            onClicked: {
                textWordsSorted.text = backEnd.getWordsSortedAlphabetically()
            }
        }

        ScrollView {
            id: scrollViewSort

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: columnLayoutSortByFrequency.bottom
            anchors.bottom: parent.bottom
            hoverEnabled: true
            anchors.bottomMargin: 20
            activeFocusOnTab: false
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            clip: true
            anchors.topMargin: 0

            Text {

                id: textWordsSorted

                width: scrollViewSort.width * 0.95
                height: scrollViewSort.height * 0.95
                color: "#000000"
                clip: false
            }
        }

        ColumnLayout {
            id: columnLayoutSortByFrequency

            x: 220
            y: 0
            width: 325
            height: 98

            Button {
                id: buttonSortByFrequency

                text: qsTr("Sort by frequency")
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                Layout.preferredWidth: 255

                onClicked: {
                    if (radioDelegateAscending.checked) {
                        textWordsSorted.text = backEnd.getWordsSortedByFrequencyAsc()
                    } else {
                        textWordsSorted.text = backEnd.getWordsSortedByFrequencyDesc()
                    }
                }
            }

            RowLayout {
                id: rowLayoutAscDesc

                Layout.preferredHeight: 52
                Layout.preferredWidth: 260

                RadioDelegate {
                    id: radioDelegateAscending

                    text: qsTr("Ascending")
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    checked: true
                }

                RadioDelegate {
                    id: radioDelegateDescending

                    text: qsTr("Descending")
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                }
            }
        }
    }
    */
    TabBar {
        id: tabBar

        y: 796
        anchors.left: columnLayoutBasicOperations.right
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.bottomMargin: 10
        enabled: true
        visible: true

        TabButton {
            id: tabButtonMatch

            text: qsTr("Match list")
        }

        TabButton {
            id: tabButtonAll

            text: qsTr("All list")
        }
    }

    ColumnLayout {
        id: columnLayoutBasicOperations

        x: 28
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 30
        anchors.rightMargin: 713

        GroupBox {
            id: groupBoxNumberOfWords

            Layout.preferredHeight: 90
            Layout.preferredWidth: 459
            title: qsTr("Number of words")

            Button {
                id: buttonRefreshWordsCount

                width: 98
                text: qsTr("Refresh ")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0

                onClicked: {
                    textUniqueWordsGeneral.text = backEnd.getNumberOfWordsInDictionary()
                    textNumberOfWordsTotalGeneral.text = backEnd.getTotalNumberOfWords()
                }
            }

            RowLayout {
                id: rowLayoutNumberOfWordsMatchGeneral

                x: -697
                anchors.left: buttonRefreshWordsCount.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 0
                anchors.leftMargin: 20
                anchors.rightMargin: -8
                anchors.bottomMargin: 0

                Label {
                    id: labelNumberOfUniqueWordsGeneral

                    color: "#000000"
                    text: qsTr("Unique words:")
                }

                Text {
                    id: textUniqueWordsGeneral

                    color: "#000000"
                    text: qsTr("0")
                    font.pixelSize: 12
                }

                Label {
                    id: labelNumberOfWordsMatchGeneral

                    color: "#000000"
                    text: qsTr("Total number of words:")
                }

                Text {
                    id: textNumberOfWordsTotalGeneral

                    color: "#000000"
                    text: qsTr("0")
                    font.pixelSize: 12
                }
            }
        }

        GroupBox {
            id: groupBoxNewWord

            Layout.preferredHeight: 90
            Layout.preferredWidth: 459
            title: qsTr("Add the word to the dictionary")

            TextField {
                id: textFieldNewWord

                color: "#000000"
                anchors.left: buttonAddWord.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                placeholderText: "Type here..."
                font.pixelSize: 12
                anchors.rightMargin: 0
                anchors.leftMargin: 20
                anchors.bottomMargin: 0
                anchors.topMargin: 0
            }

            Button {
                id: buttonAddWord

                text: qsTr("Add")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0

                onClicked: {
                    backEnd.addWordToTheDictionary(textFieldNewWord.text, 0)
                }
            }
        }

        GroupBox {
            id: groupBoxRemoveWord

            Layout.preferredHeight: 90
            Layout.preferredWidth: 459
            title: qsTr("Remove word from the dictionary")

            TextField {
                id: textFieldRemoveWord

                color: "#000000"
                anchors.left: buttonRemoveWord.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                placeholderText: "Type here..."
                font.pixelSize: 12
                anchors.leftMargin: 20
            }

            Button {
                id: buttonRemoveWord

                text: qsTr("Remove")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0

                onClicked: {
                    backEnd.removeWord(textFieldRemoveWord.text)
                }
            }
        }

        GroupBox {
            id: groupBoxCheckWord

            Layout.preferredHeight: 90
            Layout.preferredWidth: 459
            title: qsTr("Check the word in the dictionary")

            TextField {
                id: textFieldCheckWord

                color: "#000000"
                anchors.left: buttonCheckWord.right
                anchors.right: checkBox.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 12
                anchors.rightMargin: 0
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 20
                placeholderText: "Type here..."
            }

            CheckBox {
                id: checkBox

                x: 167
                width: 39
                text: qsTr("Check Box")
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 8
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                anchors.rightMargin: 0
                checkState: Qt.Unchecked
                checkable: false
            }

            Button {
                id: buttonCheckWord

                text: qsTr("Check")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                anchors.leftMargin: 0

                onClicked: {
                    if(backEnd.isWordInTheDictionary(textFieldCheckWord.text)) {
                        checkBox.checkState = Qt.Checked
                    } else {
                        checkBox.checkState = Qt.Unchecked
                    }
                }
            }
        }

        GroupBox {
            id: groupBoxGetWordFrequency

            Layout.preferredHeight: 90
            Layout.preferredWidth: 459
            title: qsTr("Get the word's frequency in the dictionary")

            TextField {
                id: textFieldGetFrequency

                color: "#000000"
                anchors.left: buttonGetFrequency.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 12
                anchors.bottomMargin: 0
                anchors.rightMargin: 39
                placeholderText: "Type here..."
                anchors.topMargin: 0
                anchors.leftMargin: 20
            }

            Button {
                id: buttonGetFrequency

                text: qsTr("Get")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.topMargin: 0
                anchors.leftMargin: 0

                onClicked: {
                    textFrequency.text = (backEnd.getWordFrequency(textFieldGetFrequency.text)).toFixed(3)
                }
            }

            Text {
                id: textFrequency

                color: "#000000"
                text: qsTr("0")
                anchors.left: textFieldGetFrequency.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 12
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 0
            }
        }

        GroupBox {
            id: groupBoxReadText

            Layout.preferredHeight: 90
            Layout.preferredWidth: 459
            title: qsTr("Read text")

            TextField {
                id: textFieldReadText

                color: "#000000"
                anchors.left: buttonReadText.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 12
                placeholderText: "File with text"
                anchors.leftMargin: 20
            }

            Button {
                id: buttonReadText

                text: qsTr("Read")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                onClicked: {
                    backEnd.readTextFromFile(textFieldReadText.text)
                }
            }
        }


        GroupBox {
            id: groupBoxReplace

            Layout.preferredHeight: 90
            Layout.preferredWidth: 459
            title: qsTr("Replace")

            Button {
                id: buttonReplace

                text: qsTr("Replace")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                onClicked: {
                    backEnd.replaceWord(textFieldInitialWord.text, textFieldReplacedWord.text)
                }
            }

            RowLayout {
                id: rawLayout

                anchors.left: buttonReplace.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 0
                anchors.bottomMargin: 0
                anchors.rightMargin: 0
                anchors.leftMargin: 20
                visible: true

                TextField {
                    id: textFieldInitialWord

                    color: "#000000"
                    font.pixelSize: 12
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    placeholderText: "Replace from"
                }

                TextField {
                    id: textFieldReplacedWord

                    color: "#000000"
                    font.pixelSize: 12
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    placeholderText: "Replace to"
                }
            }
        }

        Button {
            id: buttonSaveText

            text: qsTr("Save text")
            Layout.fillHeight: true
            Layout.fillWidth: true

            onClicked: {
                backEnd.saveText(textFieldReadText.text)
            }
        }

        GroupBox {
            id: groupBoxSaveDictionary

            x: 623
            y: 726
            Layout.preferredHeight: 90
            Layout.preferredWidth: 459
            title: qsTr("Save current dictionary")

            TextField {
                id: textFieldSaveDictionary

                color: "#000000"
                anchors.left: buttonSaveDictionary.right
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 12
                anchors.leftMargin: 20
                placeholderText: "Name of the new dictionary"
            }

            Button {
                id: buttonSaveDictionary

                text: qsTr("Save dictionary")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 0
                anchors.bottomMargin: 0

                onClicked: {
                    backEnd.saveDictionary(textFieldSaveDictionary.text)
                }
                anchors.topMargin: 0
            }
        }


        Button {
            id: buttonClearDictionary
            width: 225
            height: 40

            text: qsTr("Clear dictionary")
            Layout.fillHeight: true
            Layout.fillWidth: true

            onClicked: {
                backEnd.clearDictionary()
            }
        }
    }



}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
