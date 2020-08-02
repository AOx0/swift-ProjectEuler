//
//  main.swift
//  tests
//
//  Created by Alejandro D on 29/07/20.
//

import Foundation

let start2 = Date()
let primos = getPrimes(targetRange: 100000)

print("Finished primos: \( Date().timeIntervalSince(start2))")

func getPrimes(targetRange : Int) -> [Int] {
    var results : [Int] = []
    var counter = 1
    while true {
        var divisibleBy = false
        counter += 1
        if counter > targetRange {break}

        for previousResult in results {
            if previousResult > Int(pow(Float(counter), (1/2))) { break }
            if counter.isMultiple(of: previousResult) { divisibleBy = true; break }
        }

        if divisibleBy == false {
            results.append(counter)
        }
    }
    return results
}

func getSum(n: Double) -> Int {
    return Int((n * (n+1)) / 2)
}

let y = 6
//let primos = getPrimes(targetRange: y)
var diccionarioEncontrados : [Int:Int] = [:]

let sum = getSum(n: Double(y))
//let primos = getPrimes(targetRange: 50000)

func esNuevoFactor(_ n: Int) -> Bool {
    if diccionarioEncontrados[n] == nil{
        return true
    }
    return false
}

func esPrimo(_ n: Int) -> Bool {
    if primos.contains(n) { return true }
    return false
}
diccionarioEncontrados[1] = 1
diccionarioEncontrados[sum] = sum

for x in 2...y {
    guard esNuevoFactor(x) else { continue }
    guard esPrimo(x) else { continue}
    guard sum % x == 0 else { continue }
    
    diccionarioEncontrados[x] = x
    let entero = sum.quotientAndRemainder(dividingBy: x).quotient
    diccionarioEncontrados[entero] = entero

    var z : Int = 2
    print(x, y, z)
    while (x*z) <= y && sum % (x*z) == 0 {
        print(x*y)
        if esNuevoFactor(x*z) {
            diccionarioEncontrados[x*z] = x*z
            diccionarioEncontrados[entero] = sum.quotientAndRemainder(dividingBy: x*z).quotient
        }
        z += 1
    }
    
    
}



print(diccionarioEncontrados.keys)
print(Date().timeIntervalSince(start2))
