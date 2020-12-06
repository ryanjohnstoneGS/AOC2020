import Cocoa

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

let forms = content.components(separatedBy: .newlines).split(separator: "")

print(forms.compactMap { f in
        Set(f.joined()).count }.reduce(0, +))

print(forms.compactMap { g in g.reduce(Set(g.joined())) { r, e in r.intersection(Set(e)) }.count }.reduce(0, +)
)
