//var counter = 1
//
//struct Results {
//    var expresion : String
//    var results : [String]
//}
//
//func analyze(number: Int) -> Bool {
//    for i in 1...target {
//        if number % i == 0 { continue }
//        return false
//    }
//    return true
//}
//
//func printResults(_ num : Int) -> [String] {
//    var results : [String] = []
//    for i in 1...target {
//        results.append(String(i * num))
//    }
//    return results
//}
//
//for i in 1...1000{
//    print(printResults(i))
//}
////for i in 1...100 {
////    for i in printResults(i) {
////        if analyze(number: Int(i)!) {
////            print("Listo \(i)")
////        }
////    }
////

//3240181
var validOnes = 0
var counter = 0
let target = 20
while true {
    counter += target

    for i in 2...target {
        if counter % i == 0 { validOnes += 1 }
        else { validOnes = 0; continue }
    }
    
    //print(counter)
    if validOnes >= target {
        print(counter, terminator: "")
        print(" \(validOnes)")
    }

//    if validOnes >= target {
//        print(counter)
//        break
//    }
}
