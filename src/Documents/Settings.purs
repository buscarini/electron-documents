module Documents.Settings (SETTINGS,
  getItem,
  setItem
  -- removeItem,
  -- clear
  ) where

import Prelude
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (EXCEPTION)
import Control.Monad.Aff (Aff, makeAff)
import Data.Nullable as Nullable
import Data.Nullable (Nullable)
import Data.Maybe (Maybe)


foreign import data SETTINGS :: !

getItem
  :: forall eff
   . String
  -> Aff (settings :: SETTINGS | eff) (Maybe String)
getItem key = makeAff (\error success -> getItemForeign (readResult success) key) where
      readResult success val = success (Nullable.toMaybe val)


foreign import getItemForeign :: forall eff.
  ((Nullable String) -> Eff (settings :: SETTINGS | eff) Unit) ->
  String -> Eff (settings :: SETTINGS | eff) Unit



-- foreign import getItemForeign
--   :: forall eff
--    . String
--   -> Eff (settings :: SETTINGS | eff) (Nullable String)
--

setItem :: forall eff . String -> String -> Aff (settings :: SETTINGS | eff) Unit
setItem key value = makeAff (\error success -> setItemForeign success key value)

foreign import setItemForeign
  :: forall eff
   . (Unit -> Eff (settings :: SETTINGS | eff) Unit) ->
   String
  -> String
  -> Eff (settings :: SETTINGS | eff) Unit
--
-- foreign import removeItem
--   :: forall eff
--    . String
--   -> Eff (settings :: SETTINGS | eff) Unit
--
-- -- | Atomically empty storage of all key/value pairs.
-- -- |
-- -- | If there are no key/value pairs, this function does nothing.
-- foreign import clear
--   :: forall eff
--    . Unit
--   -> Eff (settings :: SETTINGS | eff) Unit
