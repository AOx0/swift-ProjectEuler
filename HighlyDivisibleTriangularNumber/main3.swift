//
//  main.swift
//  tests
//
//  Created by Alejandro D on 29/07/20.
//

import Foundation

let start = Date()

let primos = getPrimes(targetRange: 1000000)
print("Finished primos: \( Date().timeIntervalSince(start))")

let start2 = Date()

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

func esNuevoFactor(_ n: Int, _ diccionarioEncontrados : inout [Int:Int]) -> Bool {
    if diccionarioEncontrados[n] == nil {
        return true
    }
    return false
}

func esPrimo(_ n: Int) -> Bool {
    if primos.contains(n) { return true }
    return false
}



func getDivisibles(of num: Int) -> [Int : Int] {
    var diccionarioEncontrados : [Int:Int] = [:]
    diccionarioEncontrados[1] = 1
    diccionarioEncontrados[num] = num

    for x in 2...y {
        guard esNuevoFactor(x, &diccionarioEncontrados) else { continue }
        guard esPrimo(x) else { continue}
        guard num % x == 0 else { continue }
        
        diccionarioEncontrados[x] = x
        let entero = num.quotientAndRemainder(dividingBy: x).quotient
        diccionarioEncontrados[entero] = entero

        var z : Int = 2
        
        while (x*z) <= y && num % (x*z) == 0 {
            if esNuevoFactor(x*z, &diccionarioEncontrados) {
                diccionarioEncontrados[x*z] = x*z
                diccionarioEncontrados[entero] = num.quotientAndRemainder(dividingBy: x*z).quotient
            }
            z += 1
        }
        
        
    }

    return diccionarioEncontrados
}

var y = 1
while true {
    y += 1
    let sum = getSum(n: Double(y))
    let div = getDivisibles(of: sum)
    if div.count >= 500 { print(sum, div.keys); break }
    print(sum)
    
}


print("Finished primos: \( Date().timeIntervalSince(start2))")
