import Foundation
let start = Date()
func stringSum(num1: String, num2 : String) -> String {
    
    func impStringSum (num1: String, num2 : String) -> String {
        let num = "0"+num1
        let numm = "0"+num2
        
        var rest = 0
        var result = ""
        var finalResult = ""
        if num.count >= numm.count {
            var n = num2
            for _ in 1...(num.count-num2.count) {
                n = "0\(n)"
            }
            for i in (0..<num.count).reversed(){
                let n1 = Int(String(num[String.Index(utf16Offset: i, in: num)]))!
                let n2 = Int(String(n[String.Index(utf16Offset: i, in: n)]))!
                result += String((n1 + n2 + rest) % 10)
                rest = (n1 + n2 + rest) / 10
            }
            
        }
        for i in result.reversed(){
            finalResult += String(i)
        }
        if finalResult[String.Index(utf16Offset: 0, in: finalResult)] == "0" {
            finalResult.remove(at: finalResult.startIndex)
        }
        return finalResult
    }
    if num1.count > num2.count {
        return impStringSum(num1: num1, num2: num2)
    } else {
        return impStringSum(num1: num2, num2: num1)
    }
}

var firstNumber : String = "1"
var secondNumber : String = "1"
var solved = false

var newNumber : String = "0" {
    didSet {
        if newNumber.count == 1000 {
            print("\n\(newNumber)")
            solved.toggle()
        }
    }
}
var sum = 0
var numberOfRepetitions = 2

while !solved {
    numberOfRepetitions += 1
    print("Number of repetitions: \(numberOfRepetitions)", terminator:"\r")
    fflush(stdin)
    //guard (firstNumber + secondNumber) < 144 else { break }
    newNumber = stringSum(num1: firstNumber, num2: secondNumber)
    //newNumber = firstNumber + secondNumber
    firstNumber = secondNumber
    secondNumber = newNumber
}

print("Time executing: \(Date().timeIntervalSince(start))")
