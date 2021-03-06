module Model.TokenRequest where

import qualified Data.Aeson as J

import GHC.Generics (Generic)

import qualified Data.Text as T

data ChangePlaidToken = ChangePlaidToken {
    payToken :: T.Text,
    userIdChange :: Int
}
  deriving (Show, Eq, Generic)

instance J.ToJSON ChangePlaidToken

instance J.FromJSON ChangePlaidToken


data UserToken = UserToken {
    userToken :: T.Text,
    userId :: Int
}
 deriving (Show, Eq, Generic)

instance J.ToJSON UserToken

instance J.FromJSON UserToken