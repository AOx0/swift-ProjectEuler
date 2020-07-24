// Swift 5

struct Palindrome {
    let expression : String
    let result : Int
}

func getPalindromes() ->  [Palindrome] {
    var palindromes : [Palindrome] = []

    for i in 100...999{
        for j in 100...999{
            let result = j*i
            if String(result) == String(String(result).reversed()) {
                palindromes.append(Palindrome(expression: "\(j) * \(i)", result: result))
            }
        }
    }
    
    return palindromes
}

func analizePalindromes(palindromes: [Palindrome]) -> String {
    var largest : Palindrome = Palindrome(expression: "\(0) * \(0)", result: 0)

    for palindrome in palindromes {
        if palindrome.result > largest.result {
            largest = palindrome
        }
    }
    
    return "\(largest.expression) = \(largest.result)"
}

let largestPalindrome = analizePalindromes(palindromes: getPalindromes())
print(largestPalindrome)
