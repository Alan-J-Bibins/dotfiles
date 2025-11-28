pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import "functions"

Singleton {
    id: root
    property QtObject m3colors
    property QtObject animation
    property QtObject animationCurves
    property QtObject colors
    property QtObject rounding
    property QtObject font
    property QtObject sizes

    m3colors: QtObject {
        property bool darkmode: true

        property color m3primary: "{{ color13 }}"
        property color m3onPrimary: "{{ background }}"
        property color m3primaryContainer: "{{ color1 }}"
        property color m3onPrimaryContainer: "{{ foreground }}"

        property color m3secondary: "{{ color12 }}"
        property color m3onSecondary: "{{ background }}"
        property color m3secondaryContainer: "{{ color11 }}"
        property color m3onSecondaryContainer: "{{ color11 }}"

        property color m3background: "{{ background }}"
        property color m3onBackground: "{{ foreground }}"

        property color m3surface: "{{ background }}"
        property color m3surfaceContainerLow: "{{ color0 }}"
        property color m3surfaceContainer: "{{ color0 }}"
        property color m3surfaceContainerHigh: "{{ color8 }}"
        property color m3surfaceContainerHighest: "{{ color7 }}"
        property color m3onSurface: "{{ foreground }}"

        property color m3surfaceVariant: "{{ color4 }}"
        property color m3onSurfaceVariant: "{{ color7 }}"

        property color m3inverseSurface: "{{ foreground }}"
        property color m3inverseOnSurface: "{{ background }}"

        property color m3outline: "{{ color8 }}"
        property color m3outlineVariant: "{{ color4 }}"
        property color m3shadow: "#000000"
    }

    colors: QtObject {
        property color colSubtext: m3colors.m3outline
        property color colLayer0: m3colors.m3background
        property color colOnLayer0: m3colors.m3onBackground
        property color colLayer0Border: ColorUtils.mix(root.m3colors.m3outlineVariant, colLayer0, 0.4)
        property color colLayer1: m3colors.m3surfaceContainerLow
        property color colOnLayer1: m3colors.m3onSurfaceVariant
        property color colOnLayer1Inactive: ColorUtils.mix(colOnLayer1, colLayer1, 0.45)
        property color colLayer1Hover: ColorUtils.mix(colLayer1, colOnLayer1, 0.92)
        property color colLayer1Active: ColorUtils.mix(colLayer1, colOnLayer1, 0.85)
        property color colLayer2: m3colors.m3surfaceContainer
        property color colOnLayer2: m3colors.m3onSurface
        property color colLayer2Hover: ColorUtils.mix(colLayer2, colOnLayer2, 0.90)
        property color colLayer2Active: ColorUtils.mix(colLayer2, colOnLayer2, 0.80)
        property color colPrimary: m3colors.m3primary
        property color colOnPrimary: m3colors.m3onPrimary
        property color colSecondary: m3colors.m3secondary
        property color colSecondaryContainer: m3colors.m3secondaryContainer
        property color colOnSecondaryContainer: m3colors.m3onSecondaryContainer
        property color colTooltip: m3colors.m3inverseSurface
        property color colOnTooltip: m3colors.m3inverseOnSurface
        property color colShadow: ColorUtils.transparentize(m3colors.m3shadow, 0.7)
        property color colOutline: m3colors.m3outline
    }

    rounding: QtObject {
        property int unsharpen: 2
        property int verysmall: 8
        property int small: 12
        property int normal: 17
        property int large: 23
        property int full: 9999
        property int screenRounding: large
        property int windowRounding: 18
    }

    font: QtObject {
        property QtObject family: QtObject {
            property string main: "sans-serif"
            property string title: "sans-serif"
            property string expressive: "sans-serif"
        }
        property QtObject pixelSize: QtObject {
            property int smaller: 12
            property int small: 15
            property int normal: 16
            property int larger: 19
            property int huge: 22
        }
    }

    animationCurves: QtObject {
        readonly property list<real> expressiveDefaultSpatial: [0.38, 1.21, 0.22, 1.00, 1, 1]
        readonly property list<real> expressiveEffects: [0.34, 0.80, 0.34, 1.00, 1, 1]
        readonly property list<real> emphasizedDecel: [0.05, 0.7, 0.1, 1, 1, 1]
        readonly property real expressiveDefaultSpatialDuration: 500
        readonly property real expressiveEffectsDuration: 200
    }

    animation: QtObject {
        property QtObject elementMove: QtObject {
            property int duration: animationCurves.expressiveDefaultSpatialDuration
            property int type: Easing.BezierSpline
            property list<real> bezierCurve: animationCurves.expressiveDefaultSpatial
            property Component numberAnimation: Component {
                NumberAnimation {
                    duration: root.animation.elementMove.duration
                    easing.type: root.animation.elementMove.type
                    easing.bezierCurve: root.animation.elementMove.bezierCurve
                }
            }
        }

        property QtObject elementMoveEnter: QtObject {
            property int duration: 400
            property int type: Easing.BezierSpline
            property list<real> bezierCurve: animationCurves.emphasizedDecel
            property Component numberAnimation: Component {
                NumberAnimation {
                    duration: root.animation.elementMoveEnter.duration
                    easing.type: root.animation.elementMoveEnter.type
                    easing.bezierCurve: root.animation.elementMoveEnter.bezierCurve
                }
            }
        }

        property QtObject elementMoveFast: QtObject {
            property int duration: animationCurves.expressiveEffectsDuration
            property int type: Easing.BezierSpline
            property list<real> bezierCurve: animationCurves.expressiveEffects
            property Component numberAnimation: Component {
                NumberAnimation {
                    duration: root.animation.elementMoveFast.duration
                    easing.type: root.animation.elementMoveFast.type
                    easing.bezierCurve: root.animation.elementMoveFast.bezierCurve
                }
            }
        }
    }

    sizes: QtObject {
        property real elevationMargin: 10
    }
}

