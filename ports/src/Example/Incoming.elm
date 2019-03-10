port module Example.Incoming exposing (jsNumber)


-- PORTS

port jsNumber : (Int -> msg) -> Sub msg
