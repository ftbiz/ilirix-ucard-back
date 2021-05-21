module Lib
   ( runDefaultExample,
   )
 where


import qualified Colog as Log

import qualified Ext.Logger.Colog as Log
import qualified Ext.Logger.Config as Log



runDefaultExample :: IO ()
runDefaultExample =
   Log.usingLoggerT (Log.mkLogActionIO logConf) $ do
    --  config <- liftIO C.retrieveConfig
     runLogExample
    --  runDBExample config Dev
     Log.logInfo "Finishing application..."

logConf :: Log.LoggerConfig
logConf =
   Log.LoggerConfig
     { appInstanceName = "AppName"
     , logToStdout = True
     , logLevel = Log.Debug
     }

runLogExample :: Log.WithLog env Log.Message m => m ()
runLogExample = do
   Log.logInfo "Starting application..."
   Log.logDebug "Here is how we work!"

-- runDBExample config env =
--    case env of
--      Prod -> liftIO . withDbPool config $ \pool -> dbExample pool
--      _ ->
--        liftIO
--          . withDbPoolDebug config
--          $ \pool ->
--            dbExample pool
--    where
--      dbExample pool = liftIO . flip runSqlPersistMPool pool $ do
--        createUserRecord "+7111" "Boris" "Britva"
--        pure ()