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
            } catch DivisibleError.error {
                break
            } catch {
                return
            }
        }
        
        print("Prime Factors = \(primeFactors)")
    }
    
    enum DivisibleError : Error {
        case error
    }

    private static func findDivisibleNumber(_ number : Int) throws ->  Int {
        var contador = 2
        while true {
            if contador > number { throw DivisibleError.error }
            if number % contador == 0 {
                return contador
            }
            contador += 1
        }
    }
}

FindPrimeFactors.getPrimeFactorials(num: 600851475143)
// Prime Factors = [71, 839, 1471, 6857]
