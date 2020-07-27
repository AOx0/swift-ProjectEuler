var sum = 0
for n in 1...1000{
    let number = String(n)
    if number.count > 3 { sum += "onethousand".count; break }
    
    var unidades : Character = "a"
    var decenas : Character = "a"
    var centenas : Character = "a"
    var miles : Character = "a"
    
    if number.count == 1 {
        unidades = number[String.Index(utf16Offset: 0, in: number)]
        sum += printUnidad(unidades).count
        continue
        
    }
    if number.count == 2 {
        unidades = number[String.Index(utf16Offset: 1, in: number)]
        decenas = number[String.Index(utf16Offset: 0, in: number)]
        sum += printDecena(unidades, decenas).count ; continue
    }
    if number.count == 3 {
        switch number {
        case "100": sum += "onehundred".count ; continue
        case "200": sum += "twohundred".count ; continue
        case "300": sum += "threehundred".count; continue
        case "400": sum += "fourhundred".count ; continue
        case "500": sum += "fivehundred".count ; continue
        case "600": sum += "sixhundred".count ; continue
        case "700": sum += "sevenhundred".count ; continue
        case "800": sum += "eighthundred".count ; continue
        case "900": sum += "ninehundred".count ; continue
        default:
            unidades = number[String.Index(utf16Offset: 2, in: number)]
            decenas = number[String.Index(utf16Offset: 1, in: number)]
            centenas = number[String.Index(utf16Offset: 0, in: number)]
            sum += (printCentena(centenas).count + printDecena(unidades, decenas).count)
            continue
        }
        
    }
}

print(sum)
func printCentena(_ centena: Character) -> String {
    guard centena != "a" else { return "" }
    switch centena {
        case "0": return ""
        case "1": return "onehundredand"
        case "2": return "twohundredand"
        case "3": return "threehundredand"
        case "4": return "fourhundredand"
        case "5": return "fivehundredand"
        case "6": return "sixhundredand"
        case "7": return "sevenhundredand"
        case "8": return "eighthundredand"
        case "9": return "ninehundredand"
        default: return ""
    }
}

func printUnidad(_ number: Character) -> String {
    guard number != "a" else { return "" }
    switch number {
        case "0": return ""
        case "1": return "one"
        case "2": return "two"
        case "3": return "three"
        case "4": return "four"
        case "5": return "five"
        case "6": return "six"
        case "7": return "seven"
        case "8": return "eight"
        case "9": return "nine"
        default: return ""
    }
    
}

func printDecena(_ unidad: Character,_ decena: Character) -> String {
    guard decena != "a" else { return "" }
    var unidades : String = ""
    switch "\(decena)\(unidad)" {
    case "11": return "eleven"
    case "12": return "twelve"
    case "13": return "thirteen"
    case "14": return "fourteen"
    case "15": return "fifteen"
    case "16": return "sixteen"
    case "17": return "seventeen"
    case "18": return "eighteen"
    case "19": return "nineteen"
    default:
        unidades = printUnidad(unidad)
        switch decena {
            case "1": return "ten"
            case "2": return "twenty\(unidades ?? "")"
            case "3": return "thirty\(unidades ?? "")"
            case "4": return "forty\(unidades ?? "")"
            case "5": return "fifty\(unidades ?? "")"
            case "6": return "sixty\(unidades ?? "")"
            case "7": return "seventy\(unidades ?? "")"
            case "8": return "eighty\(unidades ?? "")"
            case "9": return "ninety\(unidades ?? "")"
            default: return "\(unidades ?? "")"
        }
    }
    
}
