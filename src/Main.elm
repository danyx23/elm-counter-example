module Main exposing (..)

import Html exposing (Html, text, div, button)
import Html.Events exposing (onClick)


type alias CounterModel =
    { counter : Int
    }


init : ( CounterModel, Cmd CounterMessage )
init =
    ( { counter = 0 }
    , Cmd.none
    )


type CounterMessage
    = Increment
    | Decrement


update : CounterMessage -> CounterModel -> ( CounterModel, Cmd CounterMessage )
update msg model =
    case msg of
        Increment ->
            ( { model | counter = model.counter + 1 }
            , Cmd.none
            )

        Decrement ->
            ( { model | counter = model.counter - 1 }
            , Cmd.none
            )


view : CounterModel -> Html CounterMessage
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (toString model.counter) ]
        , button [ onClick Increment ] [ text "+" ]
        ]


main : Program Never CounterModel CounterMessage
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
