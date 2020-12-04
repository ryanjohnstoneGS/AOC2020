import Cocoa

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

let lines = content.components(separatedBy: "\n")

//print(lines)

let validKeys = Set(["byr", "iyr", "eyr", "hgt","hcl","ecl","pid"])

var id: [String: String] = [:]
var validCount = 0
for line in lines {
    let pairs = line.components(separatedBy: " ")
    for pair in pairs {
        let parts = pair.components(separatedBy: ":")
       // print(parts)

        if parts[0].count == 0 {
          //  print(Set(id.keys))
            if Set(id.keys) == validKeys {
                validCount += 1
            }
            id = [:]
            continue
        }

        if parts[0] != "cid" {
            id[parts[0]] = parts[1]
        }
    }

    if line == lines.last {
        if Set(id.keys) == validKeys {
            validCount += 1
        }
    }
}

print(validCount)
