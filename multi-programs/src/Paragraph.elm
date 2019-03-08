module Paragraph exposing (main)


import Browser
import Html exposing (..)

main =
  let
    numbers xs = List.map (\n -> li [] [text (String.fromInt n)]) xs
  in
  ul [] <| numbers [0, 1, 2, 3, 8]
