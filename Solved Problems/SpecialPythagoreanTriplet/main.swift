let target = 1000
var founded = false
while !founded {
    for a in 1...1000 {
        guard founded == false else { break }
        for b in 1...1000 {
            guard founded == false else { break }
            let c = target - a - b
            if a*a + b*b == c*c && a + b + c == 1000 {
                print("Answer:",(a*b*c))
                founded = true
            }
        }
    }
}
