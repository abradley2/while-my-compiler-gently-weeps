module Day1 exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import String exposing (..)


{-
   The captcha requires you to review a sequence of digits
   (your puzzle input) and find the sum of all digits that
   match the next digit in the list. The list is circular,
   so the digit after the last digit is the first digit in the list.

   For example:

   1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches the fourth digit.
   1111 produces 4 because each digit (all 1) matches the next.
   1234 produces 0 because no digit matches the next.
   91212129 produces 9 because the only digit that matches the next one is the last digit, 9.
-}


parseCaptcha input =
    let
        ( num, answer ) =
            input
                |> toString
                |> split ""
                |> (\list -> list ++ [ Maybe.withDefault "10" (List.head list) ])
                |> List.foldl
                    (\currentNum ( prevNum, total ) ->
                        let
                            newTotal =
                                if (currentNum == prevNum) then
                                    total + (Result.withDefault 0 (String.toInt currentNum))
                                else
                                    total
                        in
                            ( currentNum, newTotal )
                    )
                    ( "10", 0 )
    in
        answer


main =
    div [ style [ ( "padding", "16px" ) ] ]
        [ h3 [] [ text (toString (parseCaptcha 1122)) ]
        , h3 [] [ text (toString (parseCaptcha 1111)) ]
        , h3 [] [ text (toString (parseCaptcha 1234)) ]
        , h3 [] [ text (toString (parseCaptcha 91212129)) ]
        ]
