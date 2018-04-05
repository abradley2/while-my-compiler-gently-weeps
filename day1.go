package main

/*
The captcha requires you to review a sequence of digits 
(your puzzle input) and find the sum of all digits that
match the next digit in the list. The list is circular,
so the digit after the last digit is the first digit in the list.

For example:

1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches the fourth digit.
1111 produces 4 because each digit (all 1) matches the next.
1234 produces 0 because no digit matches the next.
91212129 produces 9 because the only digit that matches the next one is the last digit, 9.
*/

import (
    "fmt";
    "strconv";
    "strings";
)

func main() {
    fmt.Println(parseCaptcha(1122))
    fmt.Println(parseCaptcha(1111))
    fmt.Println(parseCaptcha(1234))
    fmt.Println(parseCaptcha(91212129))
}

func parseCaptcha(captchaNumber int) int {
  var captchaString = strconv.Itoa(captchaNumber)
  var captchaArray = strings.Split(captchaString, "")
  
  captchaArray = append(captchaArray, captchaArray[0])
  
  var prev string
  total := 0

  for idx, number := range captchaArray {
    if prev == number && idx != 0 {
      num, err := strconv.Atoi(number)
      if err != nil {
        return total
      }
      
      total = total + num
    }
    
    prev = number
  }

  return total
}
