{-# LANGUAGE DataKinds #-}
{-# LANGUAGE RankNTypes #-}

module API.User where

import Database.Tables.User
import Model.UserSerializer (UserSerializer)
import Servant
import  Model.AllInformation

import qualified Ext.HTTP.Response as Web

type UserAPI = "user" :> (GetUser :<|> SaveUser :<|> UserAllInformation)

type GetUser = "get" :> Capture "id" Int :> Get '[JSON] (Maybe UserSerializer)

type SaveUser = "save" :> ReqBody '[JSON] UserCreation :> Post '[JSON] ()

type UserAllInformation = "all-information" :> Capture "id" Int :> Get '[JSON] (Web.WebApiHttpResponse AllInformation) 