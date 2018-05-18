
/* ---------------------------------------------------------
    Megumin Splash for Plasma made by trueleo
    i made it such that you can easily scale logo, image and
    spinner at once by changing scaleUnit on line 37 (default 2)
    scaleUnit can accept float/real number as value :D
    ---------------------------------------------------------
*/

import QtQuick 2.5

Rectangle {
    id: root
    color: "#151515"

    property int stage

    onStageChanged: {
        if (stage == 2) {
            introAnimation.running = true;
        } else if (stage == 5) {
            introAnimation.target = spinner;
            introAnimation.from = 1;
            introAnimation.to = 0;
            introAnimation.running = true;
        }
    }

    Item {
        id: contents
        anchors.fill: parent
        opacity: 0
        TextMetrics {
            id: units
            text: "_"
            property int gridUnit: boundingRect.height
            property real scaleUnit: 2
        }

        Image {
            anchors.horizontalCenter: parent.horizontalCenter
            y: spinner.y + spinner.sourceSize.width/2 - units.gridUnit*units.scaleUnit
            source: "plasma.svgz"
            sourceSize.height: units.gridUnit * 2 * units.scaleUnit
            sourceSize.width: units.gridUnit * 2 * units.scaleUnit
        }

        Image {
            id: spinner
            y: (parent.height)/2 - units.gridUnit*14 - units. scaleUnit*30
            anchors.horizontalCenter: parent.horizontalCenter
            source: "spinner.svgz"
            sourceSize.height: units.gridUnit * 4 * units.scaleUnit
            sourceSize.width: units.gridUnit * 4 * units.scaleUnit

            RotationAnimator on rotation {
                id: rotation
                from: 0
                to: 360
                duration: 1200
                loops: Animation.Infinite
            }

        }

        Image {
              id: megumin
              anchors {
              bottom: parent.bottom
              }
              property real size: units.gridUnit * 20 * units.scaleUnit
              anchors.horizontalCenter: parent.horizontalCenter
              source: "megumin.png"
              sourceSize.width: size
              sourceSize.height: size
        }


    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: contents
        from: 0
        to: 1
        duration: 1200
        easing.type: Easing.InOutQuad
    }
}
