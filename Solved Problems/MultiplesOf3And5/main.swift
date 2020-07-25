var sum = 0
for i in 3..<1000 {
    if i.isMultiple(of: 5) || i.isMultiple(of: 3) { sum += i }
}
print(sum)
