import Quickshell
import QtQuick
import Quickshell.Wayland

ShellRoot {
    id: root
    
    property string wallpaperSource: "file:///home/chandler/.config/quickshell/assets/romb.png"
    property int fillMode: Image.PreserveAspectCrop
    
    Variants {
        model: Quickshell.screens
        
        PanelWindow {
            id: win
            // screen: modelData
            
            width: screen.width
            height: screen.height
            
            WlrLayershell.layer: WlrLayer.Background
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
            color: "black"
            
            Image {
                id: wallpaperImage
                anchors.fill: parent
                
                sourceSize: Qt.size(
                    win.screen.width * win.screen.devicePixelRatio,
                    win.screen.height * win.screen.devicePixelRatio
                )
                
                source: root.wallpaperSource
                fillMode: root.fillMode
                asynchronous: true
                cache: true
                smooth: true
                
                opacity: status === Image.Ready ? 1 : 0
                Behavior on opacity {
                    NumberAnimation { duration: 600 }
                }
            }           
        }
    }
}
