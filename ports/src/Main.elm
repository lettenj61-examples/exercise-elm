module Main exposing (main)


import Browser
import Html exposing (Html, text)
import Example.Incoming as I
import Example.Outgoing as O


-- EXPORTS

main : Program () Model Msg
main =
  Browser.element
    { init = \_ -> ( "start", Cmd.none )
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


-- MODEL

type alias Model = String


-- UPDATE

type Msg
  = NoData
  | GotInt Int

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    NoData ->
      ( model, O.greeting model )

    GotInt num ->
      ( "Got: " ++ (String.fromInt num)
      , Cmd.none
      )


-- VIEW

view : Model -> Html Msg
view model =
  text model


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  I.jsNumber GotInt
