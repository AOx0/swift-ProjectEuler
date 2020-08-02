import Foundation

let start = Date()

var number = 2
//let especifico = 61200


var ultimo = 0
var up500 = 0
var count = 0

func getSum(n: Double) -> Int {
    return Int((n * (n+1)) / 2)
}


while true {
    let start = Date()
    var sum = 0; count = 0

    sum = getSum(n: Double(number))
    var factors : [Int] = []

    for i in 1...Int(sum/2) {
        if sum % i == 0 {
            count += 1;factors.append(i)
            if count > 500 { up500 += 1; print("==========================================") };
        }
    }
    count += 1; factors.append(sum)
    let end = Date()
    print("\(sum):: \(number)", "\(count) Tiempo estimado : \(end.timeIntervalSince(start))                   ", terminator: "\r")
    fflush(stdin)
    
    if count >= 500 { print(sum, number); break }
    number += 1
}

print(Date().timeIntervalSince(start))


