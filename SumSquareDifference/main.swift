
func getSumOfSquares() -> Int {
    var sum = 0
    for number in 1...100 {
        sum += (number * number)
    }
    return sum
}

func getSquareOfSum() -> Int {
    var sum = 0
    for number in 1...100 {
        sum += number
    }
    return (sum * sum)
}


print(getSquareOfSum()-getSumOfSquares())
