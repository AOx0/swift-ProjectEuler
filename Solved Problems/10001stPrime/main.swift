import Foundation

func getPrimes(printPosition : Int) -> Int {
    
    var founded = 0
    var counter = 1
    while true {
        var divisibleBy = false
        counter += 1
        
        if counter > 9 {
            let counterString = String(counter)
            let lastChar : Character =  counterString[counterString.index(before: counterString.endIndex)]
            if lastChar == "0" || lastChar == "5" || lastChar == "4" || lastChar == "2" || lastChar == "8" || lastChar == "6" { continue }
        }
        
        for j in 1..<counter {
            if j == 1 { continue }
            if counter.isMultiple(of: j) { divisibleBy = true; break }
        }
        
        founded += divisibleBy ? 0 : 1
        guard founded != printPosition else { return counter }
    }
}


let methodStart = Date()

print(getPrimes(printPosition: 10001))

let methodFinish = Date()
let executionTime = methodFinish.timeIntervalSince(methodStart)
print("Execution time: \(executionTime)")
