import Foundation

func getPrimes(targetRange : Int) -> [Int] {
    var results : [Int] = []
    var counter = 1
    while true {
        var divisibleBy = false
        counter += 1
        if counter > targetRange {break}
        
        for previousResult in results {
            if counter.isMultiple(of: previousResult) { divisibleBy = true; break }
        }
        
        if divisibleBy == false {
            results.append(counter)
            print(counter)
        }
    }
    return results
}

func sumPrimes(_ primes: [Int]) -> Int {
    var sum = 0
    for prime in primes {
        sum += prime
    }
    
    return sum
}

let methodStart = Date()

let primes = getPrimes(targetRange: 2000000) // 142913828922
let sum = sumPrimes(primes)
print(sum)

let methodFinish = Date()
let executionTime = methodFinish.timeIntervalSince(methodStart)
print("Execution time: \(executionTime)")

