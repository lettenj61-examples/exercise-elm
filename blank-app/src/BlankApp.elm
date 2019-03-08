port module BlankApp exposing (main)


import Browser


-- MAIN

main : Program () Model Msg
main =
  Browser.application
    { init = \_ _ _ -> ( (), Cmd.none )
    , view = \_ -> { title = "blank", body = [] }
    , update = \_ _ -> ( (), Cmd.none )
    , subscriptions = \_ -> Sub.none
    , onUrlRequest = \_ -> Halt
    , onUrlChange = \_ -> Halt
    }

type alias Model = ()

type Msg = Halt
