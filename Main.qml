import QtQuick
// import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland

import "root:/"
import "./components" as Components
import "./components/bar" as Bar
import "./windows" as Windows
import Quickshell
import Quickshell.Io
import QtQuick



Rectangle {
  anchors.fill: parent

  Windows.Bar { }

      // Windows.Bar {
      //
      //   // the screen from the screens list will be injected into this
      //   // property
      //   property var modelData
      //
      //
      //   modelData: modelData
      //   leftItems: [
      //           // Bar.Workspace {},
      //           Components.FastMusicLine {}
      //       ]
      //
      //
      //   // centerItems: [
      //   // ]
      //
      //   rightItems: [
      //     Bar.Clock {}
      //   ]
      // }

}

