import Quickshell
import Quickshell.Io
import "dashboard"

ShellRoot {
    id: shellRoot

    FileView {
        id: styleView
        watchChanges: true
        onFileChanged: reload()
        path: Qt.resolvedUrl("./Style.json")
        JsonAdapter {
            id: col
            property string background
            property string foreground
            property string primary
            property string primaryFixed
            property string primaryFixedDim
            property string onPrimary
            property string onPrimaryFixed
            property string onPrimaryFixedVariant
            property string primaryContainer
            property string onPrimaryContainer
            property string secondary
            property string secondaryFixed
            property string secondaryFixedDim
            property string onSecondary
            property string onSecondaryFixed
            property string onSecondaryFixedVariant
            property string secondaryContainer
            property string onSecondaryContainer
            property string tertiary
            property string tertiaryFixed
            property string tertiaryFixedDim
            property string onTertiary
            property string onTertiaryFixed
            property string onTertiaryFixedVariant
            property string tertiaryContainer
            property string onTertiaryContainer
            property string error
            property string onError
            property string errorContainer
            property string onErrorContainer
            property string surface
            property string onSurface
            property string onSurfaceVariant
            property string outline
            property string outlineVariant
            property string shadow
            property string scrim
            property string inverseSurface
            property string inverseOnSurface
            property string inversePrimary
            property string surfaceDim
            property string surfaceBright
            property string surfaceContainerLowest
            property string surfaceContainerLow
            property string surfaceContainer
            property string surfaceContainerHigh
            property string surfaceContainerHighest
            property string wallpaper
        }
    }

    Watermark {}

    Dashboard {}
}
