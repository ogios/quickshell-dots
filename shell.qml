import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland

import "root:/"


ShellRoot {
	id: root


	  Main {	}

    SocketServer {
        id: socket
        property variant geom: null

        Component.onDestruction: {
            if (socket.geom != null) {
                socket.geom.destroy()
            }
        }

        Component.onCompleted: {
            // var geomComponent = Qt.createComponent("root:/windows/Geom.qml")
            //             if (geomComponent.status == Component.Ready) {
            //                 socket.geom = geomComponent.createObject(root)
            //                 if (socket.geom == null) {
            //                     console.log("Error creating geom")
            //                 }
            //             } else {
            //                 console.log("Error loading geom")
            //                 console.log(geomComponent.errorString())
            //             }
        }

        active: true
        path: "/tmp/quickshell_zephyr.sock"
        handler: Socket {
            id: handler
            onConnectedChanged: {
                console.log(connected ? "new connection!" : "connection dropped!")
            }
            parser: SplitParser {
                onRead: msg => {
                    if (msg == "geom") {
                        if (socket.geom != null) {
                            socket.geom.destroy()
                        }
                        var geomComponent = Qt.createComponent("root:/windows/Geom.qml")
                        if (geomComponent.status == Component.Ready) {
                            socket.geom = geomComponent.createObject(root)
                            if (socket.geom == null) {
                                console.log("Error creating geom")
                            }
                        } else {
                            console.log("Error loading geom")
                            console.log(geomComponent.errorString())
                        }
                        socket.geom.socket = handler
                    }

                    if (msg == "exitgeom") {
                        socket.geom.destroy()
                    }
                }
            }
        }
    }

	// Timer {
	// 	interval: 500
	// 	running: true
	// 	onTriggered: {
	// 		var shellComponent = Qt.createComponent("root:/Main.qml")
	// 		if (shellComponent.status == Component.Ready) {
	// 			var shell = shellComponent.createObject(root)
	// 			if (shell == null) {
	// 				console.log("Error creating shell")
	// 			}
	// 		} else {
	// 			console.log("Error loading shell")
	// 			// get err
	// 			console.log(shellComponent.errorString())
	// 		}
	// 	}
	// }
	
	Component.onCompleted: {
		print(Colors.primary)
		// print(Hyprland.activeWorkspace)

		if (Config.autoWorkspaceFontSize) {
			Config.workspaceFontSize = Config.barHeight
		}
	}
}
