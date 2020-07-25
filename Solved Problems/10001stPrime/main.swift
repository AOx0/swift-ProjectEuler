import Foundation

func getPrimes(printPosition : Int) -> Int {
    
    var results : [Int] = []
    var counter = 1
    var found = 0
    while true {
        if found == printPosition { return counter }
        var divisibleBy = false
        counter += 1
        
        for previousResult in results {
            if counter.isMultiple(of: previousResult) { divisibleBy = true; break }
        }
        
        
        if divisibleBy == false {
            results.append(counter)
            found += 1
        }
    }
}


let methodStart = Date()

print(getPrimes(printPosition: 10001))

let methodFinish = Date()
let executionTime = methodFinish.timeIntervalSince(methodStart)
print("Execution time: \(executionTime)")
