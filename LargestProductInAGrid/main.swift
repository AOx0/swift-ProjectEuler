import Foundation

let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let file = dir.appendingPathComponent("BigNumber.txt")
let bigNumber = try! String(contentsOf: file, encoding: .utf8)

func getNumber(withStartIndex : Int, inSeries : String) -> Int {
    var number = ""
    let firstNumberIndex = String.Index(utf16Offset: withStartIndex, in: inSeries)
    number += String(inSeries[firstNumberIndex])
    number += String(inSeries[inSeries.index(after: firstNumberIndex)])
    
    return Int(number)!
}

enum errorSacando : Error {
    case error
}

func getNumbers(from indexList : inout [TargetIndex], assignTo: inout [Int], index : Int) throws {
    if index == 799 { throw errorSacando.error }
    for index in 0..<indexList.count {
        
        assignTo.append(getNumber(withStartIndex: indexList[index].startIndexTarget, inSeries: bigNumber))
        indexList[index].startIndexTarget += 1
    }
}

struct TargetIndex {
    var startIndexTarget : Int
}

func searchGreatestProduct(_ bigNumber : String) -> String {
    var indexList : [TargetIndex] = [ TargetIndex(startIndexTarget: 0)]
    
    var greatesResult : Double = 0
    var sum : Double = 0 { didSet { if sum > greatesResult { greatesResult = sum; print(greatesResult) } } }
    var numbersInScope : [Int] = []
    var current = 0
    for _ in 0..<bigNumber.count - 1 {
        
        do {
            try getNumbers(from: &indexList, assignTo: &numbersInScope, index: current)
        } catch { }
        
        for number1 in numbersInScope {
            for number2 in numbersInScope {
                for number3 in numbersInScope {
                    for number4 in numbersInScope {
                        sum = Double(number1 * number2 * number3 * number4)
                    }
                }
            }
        }
        
        current += 1
    }
    
    return greatesResult.debugDescription
}

print(searchGreatestProduct(bigNumber)) // 130721

func multiply(num1: String, num2: String) -> String {
        
        /// Main multiplication
        func mul(num1: String, num2 : String) -> [String] {
            
            func mulPor1 (num1: String, num2 : String) -> String {
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
            var listResults : [String] = []
            for i in num2.reversed(){
                listResults.append(mulPor1(num1: num1, num2: String(i)))
            }
            return listResults
        }
        
        /// Join multiplication results. (result1 x1) + (result2 x 10) + (result3 x 100) + (result4 x 1000) + (...)
        func join(num1: String, num2 : String) -> String {
            
            func mulPor1 (num1: String, num2 : String) -> String {
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
                return mulPor1(num1: num1, num2: num2)
            } else {
                return mulPor1(num1: num2, num2: num1)
            }
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
        var initi = "0"
        for i in resultsWithZeros {
            initi = join(num1: i, num2: initi)
        }

        return initi
    }
