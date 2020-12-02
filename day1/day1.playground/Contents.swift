import Cocoa

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

let lines = content.split(whereSeparator: \.isNewline)
let intArray = lines.map { Int($0)!}.sorted()

var i = 0
var stop = false
for line in intArray {
    if stop == true { break }
    if line > 2020 { i+=1; continue }
    for x in i+1...intArray.count-1 {
        if stop == true { break }

        let nextLine = intArray[x]
        if line + nextLine > 2020 { continue }

        for y in i+2...intArray.count-2 {

            let lineAfter = intArray[y]
            let addition = nextLine + line + lineAfter
            print(addition)
            if (addition == 2020) {
                print("HERE: \(nextLine * line * lineAfter)")
                stop = true
            }
        }
    }
    i += 1
}

