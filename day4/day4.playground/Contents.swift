import Cocoa

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

let lines = content.components(separatedBy: "\n")

let validKeys = Set(["byr", "iyr", "eyr", "hgt","hcl","ecl","pid"])

var id: [String: String] = [:]
var validCount = 0
for line in lines {
    let pairs = line.components(separatedBy: " ")
    for pair in pairs {
        let parts = pair.components(separatedBy: ":")

        if parts[0].count == 0 {
            if Set(id.keys) == validKeys {
                if validValues(id) {
                    validCount += 1
                }
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
            if validValues(id) {
                validCount += 1
            }
        }
    }
}

func validValues(_ id: [String:String]) -> Bool {
    for (key,value) in id {
        switch PassportKeys(rawValue: key) {
        case .byr:
            if value.doesNotMatch("(19[2-9][0-9])|(200[0-2])") {
                return false
            }
        case .iyr:
            if value.doesNotMatch("201[0-9]|2020") {
                return false
            }
        case .eyr:
            if value.doesNotMatch("202[0-9]|2030") {
                return false
            }
        case .hgt:
            if value.doesNotMatch("(1[5-8][0-9]|19[0-3])cm|(59|6[0-9]|7[0-6])in") {
                return false
            }
        case .hcl:
            if value.doesNotMatch("#[0-9a-f]{6}") {
                return false
            }
        case .ecl:
            if value.doesNotMatch("(amb|blu|brn|gry|grn|hzl|oth)") {
                return false
            }
        case .pid:
            if value.doesNotMatch("^[0-9]{9}$") {
                return false
            }else {
                print(value)
            }
        case .none: break

        }
    }

    return true
}

enum PassportKeys: String {
    case byr
    case iyr
    case eyr
    case hgt
    case hcl
    case ecl
    case pid
}

extension String {
    func doesNotMatch(_ string: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: string)
        let range = NSRange(location: 0, length: self.utf16.count)
        return regex.firstMatch(in: self, options: [], range: range) == nil
    }
}
print(validCount)
