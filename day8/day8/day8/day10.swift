//
//  day10.swift
//  day8
//
//  Created by Ryan Johnstone on 10/12/2020.
//

import Foundation

func day10() {

    func partA() {
        var lines = input.components(separatedBy: .newlines).map { Int($0)! }

        var oneJolts = 0
        var threeJolts = 1

        lines.sort()
        lines.insert(0, at: 0)

        for (index, num) in lines.enumerated() {
            let nextIndex = index + 1
            if nextIndex < lines.count {
                let diff = lines[nextIndex] - num
                if diff == 1 {
                    oneJolts += 1
                } else if diff == 3 {
                    threeJolts += 1
                }
            }
        }

        print(oneJolts * threeJolts)
    }

    func partB() {
        var lines = input.components(separatedBy: .newlines).map { Int($0)! }

        lines.sort()
        lines.append(lines.last! + 3)

        var ans = [0:1]

        for num in lines {
            ans[num] = ans[num-1, default: 0] + ans[num-2, default: 0] + ans[num-3, default: 0]
        }

        print("ANS \(ans[lines.last!]!)")
    }

    partA()
    partB()
}

fileprivate let input = """
26
97
31
7
2
10
46
38
112
54
30
93
18
111
29
75
139
23
132
85
78
99
8
113
87
57
133
41
104
98
58
90
13
91
20
68
103
127
105
114
138
126
67
32
145
115
16
141
1
73
45
119
51
40
35
150
118
53
80
79
65
135
74
47
128
64
17
4
84
83
147
142
146
9
125
94
140
131
134
92
66
122
19
86
50
52
108
100
71
61
44
39
3
72
"""
