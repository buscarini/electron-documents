module Document where

import Electron.BrowserWindow

newtype Path = Path String

type Rect = { x :: String, y:: String, width:: String, height:: String }

data Document = Document Path BrowserWindow

data RecentDocument = Recent Path Rect
