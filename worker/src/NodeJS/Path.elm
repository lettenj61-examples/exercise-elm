port module NodeJS.Path exposing
  ( PathInfo
  , parse
  , pathInfo
  )


-- PORTS

port parse : String -> Cmd msg

port pathInfo : (PathInfo -> msg) -> Sub msg


-- TYPES

type alias PathInfo =
  { base : String
  , dir : String
  , ext : String
  , name : String
  , root : String
  }
