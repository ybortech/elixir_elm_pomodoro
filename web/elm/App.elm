module App exposing (..)
import Html exposing (..)
import Html.App exposing (beginnerProgram)
import Html exposing (div, text, button)
import Html.Events exposing (onClick)

main : Program Never
main =
    beginnerProgram { model = {state = Initial}, view = view, update = update }

type State = Initial | Started
type alias Model = {
    state : State
}

view model =
    case model.state of
        Initial ->
          div [][
            button [onClick StartTimer] [ text "Start Timer"]
          ]
        Started ->
          div [][
            button [onClick StopTimer] [ text "Stop Timer"]
          ]

type Msg = StartTimer | StopTimer

update : Msg -> Model -> Model
update msg model =
    case msg of
        StartTimer ->
            {state = Started}
        StopTimer ->
            {state = Initial}
