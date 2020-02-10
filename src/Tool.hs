module Tool
    ( opts
    , rules
    , main
    ) where

import qualified Development.Shake as Shake

import qualified State
import qualified Parse
import qualified Doneshooting
import qualified Dagsdato
import qualified Dump
import qualified Shooting
import qualified Session
import qualified Photographer
import qualified Camera


opts :: Shake.ShakeOptions
opts = Shake.shakeOptions { Shake.shakeColor = True }


rules :: Parse.Parse -> Shake.Rules ()
rules model = do
    let dump = Parse._dump model
    Shake.want []


main :: IO ()
main = do
    let dump = Dump.state "eJ"
    let doneshooting = Doneshooting.state "gg" "gg"
    let dagsdato = Dagsdato.state "gg" "gg"
    let shooting = Shooting.state "gg"
    let session = Session.state "gg"
    let photographer = Photographer.state "gg"
    let camera = Camera.state "gg"
    let state = State.state
            dump
            doneshooting
            dagsdato
            shooting
            session
            photographer
            camera
    let parse = Parse.fromState state
    Shake.shake opts (rules parse)
