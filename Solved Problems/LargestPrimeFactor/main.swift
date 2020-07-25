struct FindPrimeFactors {
    
    public static func getPrimeFactorials(num : Int) {
        var primeFactors : [Int]  = []
        var num = num
        
        while true{
            var divisibleBy = 1
            do {
                divisibleBy = try findDivisibleNumber(num)
                num = num / divisibleBy
                primeFactors.append(divisibleBy)
            } catch DivisibleError.allDone {
                break
            } catch {
                return
            }
        }
        
        print("Prime Factors = \(primeFactors)")
    }
    
    enum DivisibleError : Error {
        case allDone
    }

    private static func findDivisibleNumber(_ number : Int) throws ->  Int {
        var counter = 2
        while true {
            if counter > number { throw DivisibleError.allDone }
            if number % counter == 0 {
                return counter
            }
            counter += 1
        }
    }
}

FindPrimeFactors.getPrimeFactorials(num: 600851475143)
// Prime Factors = [71, 839, 1471, 6857]
