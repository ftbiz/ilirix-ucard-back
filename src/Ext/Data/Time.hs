module Ext.Data.Time
where

import Control.Monad.IO.Class (MonadIO (..))
import qualified Data.Time as Time
import qualified Database.Persist.Postgresql as P

class
  (Monad m) =>
  MonadClock m
  where
  currentTime :: m Time.UTCTime

instance MonadClock IO where
  currentTime = Time.getCurrentTime

now :: MonadIO m => m Time.UTCTime
now = liftIO currentTime