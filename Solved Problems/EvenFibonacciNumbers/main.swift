var firstNumber : Int = 1
var secondNumber : Int = 1
var newNumber : Int = 0
var sum = 0
while true{
    guard (firstNumber + secondNumber) < 4000000 else { break }
    newNumber = firstNumber + secondNumber
    if newNumber % 2 == 0 {sum += newNumber}
    firstNumber = secondNumber
    secondNumber = newNumber
}
print(sum)
