import Foundation

//var number = 1
////let especifico = 61200
//
//
//var ultimo = 0
//var up500 = 0
//var count = 0
//
func getSum(n: Double) -> Int {
    return Int((n * (n+1)) / 2)
}
//
//repeat {
//    let start = Date()
//    var sum = 0; count = 0
//
//    sum = getSum(n: Double(number))
//    var factors : [Int] = []
//
//    for i in 1...Int(sum/2) {
//        if sum % i == 0 {
//            count += 1;factors.append(i)
//            if count > 500 { up500 += 1; print("==========================================") };
//        }
//    }
//    count += 1;factors.append(sum)
//    let end = Date()
//    print("\(sum):: \(number)", "(\(count) : \(factors) -- Tiempo estimado : \(end.timeIntervalSince(start)) ")
//    number += 1
//
//} while number < 15
//
//
func getPrimes(targetRange : Int) -> [Int] {
    var results : [Int] = []
    var counter = 1
    while true {
        var divisibleBy = false
        counter += 1
        if counter > targetRange {break}

        for previousResult in results {
            if previousResult > Int(pow(Float(counter), 2.0)) { break }
            if counter.isMultiple(of: previousResult) { divisibleBy = true; break }
        }

        if divisibleBy == false {
            results.append(counter)
        }
    }
    return results
}


//let y = 3213
////let primos = getPrimes(targetRange: y)
//var diccionarioEncontrados : [Int:Int] = [:]
//
////let sum = getSum(n: Double(y))
////let primos = getPrimes(targetRange: 50000)
//
//func esNuevoFactor(_ n: Int) -> Bool {
//    if diccionarioEncontrados[n] == nil{
//        return true
//    }
//    return false
//}
//
//func esPrimo(_ n: Int) -> Bool {
//    if primos.contains(n) { return true }
//    return false
//}
//diccionarioEncontrados[1] = 1
//diccionarioEncontrados[sum] = sum

//for x in 2...y {
//    guard esNuevoFactor(x) else { continue }
//    guard esPrimo(x) else { continue}
//    guard sum % x == 0 else { continue }
//
//    diccionarioEncontrados[x] = x
//    let entero = sum.quotientAndRemainder(dividingBy: x).quotient
//    diccionarioEncontrados[entero] = entero
//
//    var z : Int = 2
//    while (x*z) <= y && sum % (x*z) == 0 {
//        if esNuevoFactor(x*z) {
//            diccionarioEncontrados[x*z] = x*z
//            let entero = sum.quotientAndRemainder(dividingBy: x*z).quotient
//            diccionarioEncontrados[entero] = entero
//        }
//        z += 1
//    }
//}

let start = Date()
//print(diccionarioEncontrados.count)
print(getPrimes(targetRange: 2000000))

let finish = Date()
print(finish.timeIntervalSince(start))
