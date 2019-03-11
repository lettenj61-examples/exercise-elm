port module Example exposing (..)


import NodeJS.Path as Path


-- PORTS

port putStrLn : String -> Cmd msg


-- EXPORTS

main : Program () Model Msg
main =
  Platform.worker
    { init = \_ ->
      ( State "start"
      , Cmd.batch
        [ putStrLn "Elm [start]"
        , Path.parse "/home/elm"
        ]
      )
    , update = update
    , subscriptions = subscriptions
    }


-- MODEL

type Model =
  State String


-- UPDATE

type Msg
  = AskHome
  | ParsedPath Path.PathInfo

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    AskHome ->
      ( model, Cmd.none )

    ParsedPath info ->
      ( State info.dir
      , putStrLn <| "root: " ++ info.root
      )


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.batch
    [ Path.pathInfo ParsedPath
    ]
