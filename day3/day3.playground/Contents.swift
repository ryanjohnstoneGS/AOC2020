import Cocoa

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

let lines = content.components(separatedBy: "\n")

func findTrees(right: Int, down: Int) -> Int {
    var currentSquare = 0
    var treeCount = 0

    for i in stride(from: down, to: lines.count, by: down) {
        let line = lines[i]

        currentSquare += right
        if currentSquare >= line.count {
            currentSquare -= line.count
        }

        let index = line.index(line.startIndex, offsetBy: currentSquare)

        let character = line[index]

        if character == "#" {
            treeCount += 1
        }
    }


    return treeCount
}

var one = findTrees(right: 1, down: 1)
var two = findTrees(right: 3, down: 1)
var three = findTrees(right: 5, down: 1)
var four = findTrees(right: 7, down: 1)
var five = findTrees(right: 1, down: 2)


print(one*two*three*four*five)
