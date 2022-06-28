/*This file contains all the QML used in the front end development of an application game.*/
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import RandomColor 1.0 //RandomColor is a class created in C++ for the pure purpose of generating a random color.

Window {
    id: myWindow
    width: 400
    height: 500
    visible: true
    title: qsTr("Color Game 2.0")

    property string firstColor: "Red"
    property string secondColor: "Green"
    property string thirdColor: "Blue"

    RandomColor{
        id: myRandomColorObjectLabel
        onRandColor: function (hexCol, colName) { mainLabel.color = hexCol; }
    }

    function getRandomColor() {

        var val = 0
        val = Math.floor(Math.random() * 3);

        if(val === 0){ mainLabel.text = firstColor; } //Red
        if(val === 1){ mainLabel.text = secondColor; } //Green
        if(val === 2){ mainLabel.text = thirdColor; } //Blue

        myRandomColorObjectLabel.generateRandomColor();

    }

    function isInside(a,b){ //Will check if the coordinates passed make the cicle fully fit inside the main circle.

        var x = middleCircle.x;
        var y = middleCircle.y;
        //console.log("x:" + a + ", y:" + b); //for testing

        if(x < a && x + 100 > a + 80 && y < b && y + 100 > b + 80){
            //console.log("true"); //for testing
            return true;
        }

        //console.log("false"); //for testing
        return false;
    }

    Item { // Item object is the background image.
        width: parent.width
        height: parent.height
        z:0

        Image {
            id: background
            anchors.fill: parent
            source: "qrc:/images/colorBackground.jpg"
            fillMode: Image.PreserveAspectCrop
        }
    }



    Rectangle{ //Color label -- It will change based on current circle droped into the middleCircle
        id: topLabel
        x: parent.width / 2 - (width / 2)
        y: parent.height / 3 - height * 1.2
        radius: 10
        width: 200
        height: 80
        border.width: 5
        border.color: "black"
        Layout.alignment: Qt.AlignCenter
        color: "white"

        Label{
            id: mainLabel
            text: "Red"
            color: "black"
            anchors.centerIn: parent
            font.pixelSize: 45
            font.bold: true
        }
    }

    Rectangle{ //Middle circle will be used to drop the colored circles.
        id: middleCircle
        x: parent.width / 2 - (width / 2)
        y: parent.height / 2 - (height / 2)
        radius: width
        width: 100
        height: 100
        border.width: 5
        border.color: "black"
        Layout.alignment: Qt.AlignCenter
        color: "white"
    }


    Rectangle{
        id: firstCircle
        x: myWindow.width / 3 - width
        y: myWindow.height / 3 * 2 + (height / 4)
        width: 80
        height: 80
        color: "#FF0000" //Red
        radius: width

        RandomColor{
            id: myRandomColorObject
            /*Injection of parameters into signal handlers is deprecated.
                Use JavaScript functions with formal parameters instead. RancomColor
                emits a signal with a QVariant parameter, we must use the following method
                and synthax to receive the data properly. Below, we are receiving the QVariant
                as "data", and we then user it inside of the function definition to set the
                text of our label to the info inside "data."*/
            onRandColor:  function (hexCol, colName) {
                firstCircle.color = hexCol;
                firstColor = colName;
            }
        }

        MouseArea{
            id: mouseArea1
            anchors.fill: parent
            drag.target: parent
            onReleased: {
                if(mainLabel.text === firstColor && isInside(firstCircle.x, firstCircle.y)){
                    myRandomColorObject.generateRandomColor();
                    getRandomColor();
                }

                firstCircle.x = myWindow.width / 3 - width
                firstCircle.y = myWindow.height / 3 * 2 + (height / 4)
            }
        }
    }

    Rectangle{
        id: secondCircle
        x: myWindow.width / 2 - (width / 2)
        y: myWindow.height / 3 * 2 + (height / 4)
        width: 80
        height: 80
        color: "#008000" //Green
        radius: width

        RandomColor{
            id: myRandomColorObject2
            onRandColor:  function (hexCol, colName) {
                secondCircle.color = hexCol;
                secondColor = colName;
            }
        }

        MouseArea{
            id: mouseArea2
            anchors.fill: parent
            drag.target: parent
            onReleased: {
                if(mainLabel.text === secondColor && isInside(secondCircle.x, secondCircle.y)){
                    myRandomColorObject2.generateRandomColor();
                    getRandomColor();
                }

                secondCircle.x = myWindow.width / 2 - (width / 2)
                secondCircle.y = myWindow.height / 3 * 2 + (height / 4)
            }
        }
    }

    Rectangle{
        id: thirdCircle
        x: myWindow.width / 3 * 2
        y: myWindow.height / 3 * 2 + (height / 4)
        width: 80
        height: 80
        color: "#0000FF" //Blue
        radius: width

        RandomColor{
            id: myRandomColorObject3
            onRandColor:  function (hexCol, colName) {
                thirdCircle.color = hexCol;
                thirdColor = colName;
            }
        }

        MouseArea{
            id: mouseArea3
            anchors.fill: parent //We fill the parent(Item/MyItem)
            drag.target: parent //We drag parent(Item/MyItem)
            onReleased: {
                if(mainLabel.text === thirdColor && isInside(thirdCircle.x, thirdCircle.y)){
                    myRandomColorObject3.generateRandomColor();
                    getRandomColor();
                }

                //console.log("x:" + thirdCircle.x + " y:" + thirdCircle.y); //for testing
                thirdCircle.x = myWindow.width / 3 * 2
                thirdCircle.y = myWindow.height / 3 * 2 + (height / 4)
            }
        }
    }



}
