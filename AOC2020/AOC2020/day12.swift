//
//  day12.swift
//  AOC2020
//
//  Created by Ryan Johnstone on 12/12/2020.
//

import Foundation

func day12() {

    enum Direction: String {
        case N
        case E
        case S
        case W
        case L
        case R
        case F
    }

    let points = [Direction.N, Direction.E, Direction.S, Direction.W]

    func part1() {
        let lines = input.components(separatedBy: .newlines)

        var EW = 0
        var NS = 0
        var facing = Direction.E

        for line in lines {
            let action = "\(line.first!)"
            let value = Int(line.dropFirst())!

            switch Direction(rawValue: action) {
            case .N:
                NS += value
            case .E:
                EW += value
            case .S:
                NS -= value
            case .W:
                EW -= value
            case .L:
                let move = value/90
                let index = points.firstIndex(of: facing)!
                var newIndex = index - move
                while newIndex < 0 {
                    newIndex += 4
                }
                facing = points[newIndex]
            case .R:
                let move = value/90
                let index = points.firstIndex(of: facing)!
                var newIndex = index + move
                while newIndex >= 4 {
                    newIndex -= 4
                }
                facing = points[newIndex]

            case .F:
                switch facing {
                case .N:
                    NS += value
                case .E:
                    EW += value
                case .S:
                    NS -= value
                case .W:
                    EW -= value
                default:
                    break
                }

            default:
                break
            }

        }

        print(abs(NS) + abs(EW))
    }

    func part2() {
        let lines = input.components(separatedBy: .newlines)

        struct Waypoint {
            var EW = 10
            var NS = 1
        }
        var waypoint = Waypoint()
        var EW = 0
        var NS = 0

        for line in lines {
            let action = "\(line.first!)"
            let value = Int(line.dropFirst())!

            switch Direction(rawValue: action) {
            case .N:
                waypoint.NS += value
            case .E:
                waypoint.EW += value
            case .S:
                waypoint.NS -= value
            case .W:
                waypoint.EW -= value
            case .L:
                var move = value/90

                while move > 0 {
                    let oldEW = waypoint.EW
                    let oldNS = waypoint.NS
                    waypoint.EW = oldNS * -1
                    waypoint.NS = oldEW

                    move -= 1
                }
            case .R:
                var move = value/90

                while move > 0 {
                    let oldEW = waypoint.EW
                    let oldNS = waypoint.NS
                    waypoint.EW = oldNS
                    waypoint.NS = oldEW * -1

                    move -= 1
                }

            case .F:
                EW += value * waypoint.EW
                NS += value * waypoint.NS

            default:
                break
            }

        }

        print(abs(NS) + abs(EW))
    }

    part2()
}

fileprivate let input = """
W4
N5
F23
E1
L90
N5
F62
W2
L90
F56
W1
L90
W1
S4
F69
R90
F40
R90
F86
S4
F94
N4
R180
F2
W4
R90
S5
R180
W3
S1
E2
F79
R90
S4
L90
N5
F6
L90
N2
F92
R90
W2
R90
F99
E2
F72
W4
S3
R90
W4
L90
W2
S3
F89
W2
N1
F27
L90
S1
R90
F14
N4
L90
N2
F23
W4
L90
F18
N1
R180
F92
N1
L90
F32
S1
L180
N4
W5
S1
E4
N2
R90
S2
R90
E1
F89
R90
S5
F5
F16
N3
F68
R90
N4
L180
F22
N2
R90
S5
R180
E3
F68
R90
F55
L90
F4
E4
F87
E1
L90
L180
S1
W5
S1
S5
W3
F67
N5
S3
F37
W2
F48
S2
L180
S3
R90
E5
L90
F3
R90
N3
W5
L90
N1
F85
R180
N5
R90
W5
S3
L180
E5
N3
F35
R180
W2
F54
N4
L180
F90
S3
E5
F34
W2
R270
F24
E2
F71
R90
F66
W4
S3
F47
S2
L270
F69
N5
F91
W5
L90
E1
S1
L270
F91
W3
N4
E1
F52
R90
N4
F17
N1
F27
R90
N4
W2
R90
W2
F84
W2
F13
R90
W4
N2
R90
W5
F52
L90
E3
F49
R90
W1
R90
F93
R90
E5
F34
L90
F72
S2
L90
E1
R90
F12
E2
N2
L90
F28
L180
E5
R180
E4
R180
F43
N3
F85
W4
S3
E5
R270
F45
W4
L90
N5
R180
N2
F51
E3
S5
W3
N5
R180
N3
F99
W3
F80
S5
E5
F56
W4
F54
W4
F90
S4
F85
W4
F49
W2
E5
R180
F75
W4
R90
N2
L90
S4
L270
S5
F77
S5
R90
S4
R90
N5
W4
F47
E5
S5
R90
S5
F30
S3
F25
W1
N5
L90
N3
F15
W1
N1
F47
W3
N4
W4
W3
F4
W2
L270
W1
N2
F84
R90
F6
R180
W3
R180
W4
S1
F92
E1
N1
W2
R180
N4
W4
F38
L90
W1
L90
E3
R180
W5
R180
F45
R90
E2
N3
L90
F35
R180
E4
N5
L90
F2
N1
R90
F20
L90
W3
F64
L90
F98
L90
N2
F36
R270
S1
R90
F100
E1
N1
L90
F46
N1
N4
E2
L270
N3
W1
F84
S3
F33
N5
E1
F37
N2
E3
N4
L270
F44
L180
F57
E4
N2
L90
N5
W1
L180
S3
L90
E3
L90
E2
L270
S3
F70
L90
E4
R90
E4
S3
F16
E3
N2
F51
R180
E4
N3
F52
R90
N2
R90
S3
L90
E2
F74
L90
W4
R180
W3
S3
F2
N4
L180
E3
F38
E3
F37
R90
F68
R180
F62
W4
N3
F70
E5
F50
N3
F6
R180
F25
N4
R90
F10
L90
F53
S1
F32
R90
F69
S2
W4
S5
R90
F10
R90
F39
W3
F55
E4
F16
W1
L90
E1
L270
N1
E4
F94
N2
W2
F23
N3
F51
L180
S1
F83
L90
N3
R90
F5
N1
L90
F80
E4
E1
F51
R180
F14
L90
F28
L90
W1
L180
N3
R90
E5
F21
R90
E5
F95
R180
S2
E1
F69
R90
S3
F83
W5
F7
S4
R90
F4
W4
L90
S5
F67
R90
W2
F59
N5
R90
F63
E3
L90
E1
S3
L90
E5
R90
F40
W2
L90
F86
E1
N1
E3
F25
L180
F3
R180
F47
S5
F94
L180
F10
S3
W2
F95
S3
L90
F38
N4
R90
F51
L90
F27
E1
F93
N1
F27
L180
E5
S1
E4
N3
L90
N3
W3
S1
L180
E2
E2
F34
E1
S4
E4
F77
F49
W4
N3
F46
L90
E1
F85
R180
S4
E3
R90
N1
R90
F8
E1
F40
R180
E5
F68
F15
R180
W5
F24
F30
L90
L90
F65
E5
L180
F44
L90
W2
F28
E2
L180
S4
F91
L90
F41
E3
F100
R90
W2
S2
F87
R90
W5
F43
W3
S3
F53
S3
F29
E3
F83
L90
F85
N1
E3
L90
E2
L180
E5
S2
N1
R90
F67
E5
R180
F88
S4
R90
E5
F72
W4
N2
R90
N2
L90
S5
F2
R180
E5
R180
F92
E2
F90
L180
E2
L90
W4
S4
R90
S4
L90
S4
L180
F54
E5
L270
F80
E5
N3
F84
S4
F13
S3
W4
F90
W3
N3
F65
E4
F33
L90
W4
F97
N1
R90
S3
L90
F71
R90
L90
F99
E2
R90
F76
N3
R90
N3
F49
R180
N5
N3
W4
F24
W1
F79
L90
F59
R90
F73
R180
F53
S5
F72
E5
F40
E2
F28
W1
F96
N2
R90
W5
N3
E1
N1
L90
E1
F85
L90
F45
S4
W2
F77
N4
R270
E1
R90
E1
F32
S5
F93
W4
F38
N1
W2
R180
S2
F44
L90
S1
E1
S2
E5
N4
E2
S4
W4
F27
"""
