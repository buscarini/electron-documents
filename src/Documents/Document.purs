module Documents.Document (
    WinId
) where

import Data.Maybe

newtype WinId = WinId Int

newtype Path = Path String

type Rect = { x :: String, y:: String, width:: String, height:: String }

data Document = Document WinId (Maybe Path) Rect

data Recent = Recent Path Rect

