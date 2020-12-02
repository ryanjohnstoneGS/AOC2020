import Cocoa

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

var validCount = 0
for line in content.components(separatedBy: "\n") {
    print(line)
    if line.count == 0 { break }

    let spaceSeperated = line.components(separatedBy: " ")

    let range = spaceSeperated.first!
    let password = spaceSeperated.last!
    let character = spaceSeperated[1].first!

    let min = Int(range.components(separatedBy: "-").first!)!
    let max = Int(range.components(separatedBy: "-")[1])!

    if min > 0 {
        if !password.contains(character) {
            continue
        }

        var occurenceCount = 0
        for char in password {
            if char == character {
                occurenceCount += 1
            }
        }

        if occurenceCount >= min && occurenceCount <= max {
            validCount += 1
        }
    }
}

print(validCount)
