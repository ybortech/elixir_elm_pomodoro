module App exposing (..)
import Html exposing (..)
import Html.App as App
import Html exposing (Html)
import Html exposing (div, text, button)
import Html.Events exposing (onClick)
import Time exposing (Time, second)

main : Program Never
main =
    App.program {
        init = init,
        view = view,
        update = update,
        subscriptions = subscriptions
    }

type State = Initial | Started
type alias Model = {
    state : State,
    elapsed_time: Int
}

init : (Model, Cmd Msg)
init = ({state = Initial, elapsed_time = 0}, Cmd.none)

view : Model -> Html Msg
view model =
    case model.state of
        Initial ->
          div [][
            button [onClick StartTimer] [ text "Start Timer"]
          ]
        Started ->
          div [][
            div [] [text(toString model.elapsed_time)],
            button [onClick StopTimer] [ text "Stop Timer"]
          ]

type Msg = StartTimer
         | StopTimer
         | Tick Time

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        StartTimer ->
            ({model | state = Started}, Cmd.none)
        StopTimer ->
            init
        Tick newtime ->
            if model.state == Initial then
                (model, Cmd.none)
            else
              ({model | elapsed_time = model.elapsed_time + 1}, Cmd.none)
subscriptions : Model -> Sub Msg
subscriptions model =
  Time.every second Tick
