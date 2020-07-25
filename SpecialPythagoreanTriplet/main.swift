import Foundation

enum FindError : Error {
    case notFound
    case targetNumExceeded(exceededNum : Double, target: Double)
}

func findABC(num: Double) throws -> [Double] {
    var num1 : Double = 1
    
    while true {
        for num2 in 1...200 {
            for num3 in 1...200 {
                let num1 = Double(num1)
                let num2 = Double(num2)
                let num3 = Double(num3)
                //if (pow(num1, 2) + pow(num2, 2) + pow(num3, 2)) > num { throw FindError.targetNumExceeded(exceededNum: pow(num1, 2) + pow(num2, 2) , target: num) }
                if pow(num1, 2) + pow(num2, 2) + pow(num3, 2) == num && pow(num1, 2) + pow(num2, 2) == pow(num3, 2)  {
                    return [num1,num2,num3]
                }
            }
        }
        num1 += 0.01
        
        if num1 == 200 { throw FindError.notFound }
    }
}

let start = Date()

do {
    try print(findABC(num: 1000))
} catch FindError.notFound {
    print("Not found. Not in searching range / config")
} catch FindError.targetNumExceeded(let exceededNum, let target) {
    print("Not Found. Exceeded target number (\(target) < \(exceededNum))")
}

let finish = Date()
print("Elapsed time: \(finish.timeIntervalSince(start))")



