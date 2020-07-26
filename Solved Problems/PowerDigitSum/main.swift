import Foundation

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

// MARK: - Multiplication Function
func stringMultiplication(num1: String, num2: String) -> String {
    
    func mul(num1: String, num2 : String) -> [String] {
        
        func impStringMultiplication (num1: String, num2 : String) -> String {
            let num = "0"+num1
            var rest = 0
            var result = ""
            var finalResult = ""
            if num.count >= num2.count {
                for x in num2.reversed() {
                    for y in num.reversed() {
                        result += String((Int(String(x))! * Int(String(y))!+rest) % 10)
                        rest =  (Int(String(x))! * Int(String(y))!+rest) / 10
                    }
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
        var resultsList : [String] = []
        for i in num2.reversed(){
            resultsList.append(impStringMultiplication(num1: num1, num2: String(i)))
        }
        return resultsList
    }
    
    var listWithResults : [String] = []
    if num1.count > num2.count {
        listWithResults = mul(num1: num1, num2: num2)
    } else {
        listWithResults = mul(num1: num2, num2: num1)
    }
    

    var zerosToAdd = ""
    var resultsWithZeros : [String] = []
    for result in listWithResults {
        resultsWithZeros.append(result + zerosToAdd)
        zerosToAdd += "0"
        
    }
    var finalResult = "0"
    for i in resultsWithZeros {
        finalResult = stringSum(num1: i, num2: finalResult)
    }

    return finalResult
}

var result = "1"

func stringPower(base: String, exponent: Int) -> String {
    for _ in 1...Int(exponent){ result = stringMultiplication(num1: result, num2: base) }
    return String(result)
}

func sumResult(_ result : String) -> String {
    var sum : String = "0"
    for digit in result {
        sum = stringSum(num1: sum, num2: String(digit))
    }
    return sum
}

let power = stringPower(base: "2", exponent: 1000)
let sumOfPowerDigits = sumResult(power)

print(sumOfPowerDigits)
