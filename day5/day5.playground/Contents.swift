import Cocoa

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

let lines = content.components(separatedBy: "\n")

var highestSeatId = 0
for line in lines {
    highestSeatId = max(highestSeatId, findSeat(line))
}

print(highestSeatId)

func search(code: String, low: Int, high: Int, frontCode: Character) -> Int {
    code.reduce((low,high)) { interval, char in
        let (low,high) = interval
        let mid = low + (high - low) / 2
        return char == frontCode ? (low, mid) : (mid + 1, high)
    }.0
}

func solve5b(_ input: [String]) -> Int {
    let seats = Set(input).map { findSeat(String($0)) }
    return (seats.min()!...seats.max()!).filter {
        return !(seats.contains($0))
    }.first!
}

func findSeat(_ code: String) -> Int {
    let row = search(code: String(code.prefix(7)), low: 0, high: 127, frontCode: "F")
    let column = search(code: String(code.suffix(3)), low: 0, high: 7, frontCode: "L")
    return 8 * row + column
}

print(solve5b(lines))
