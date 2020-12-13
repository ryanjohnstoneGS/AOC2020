//
//  day13.swift
//  AOC2020
//
//  Created by Ryan Johnstone on 13/12/2020.
//

import Foundation


func day13() {
    func part1() {
        let lines = input.components(separatedBy: .newlines)
        let timestamp = Int(lines.first!)!
        let buses = lines[1].components(separatedBy: ",").filter { $0 != "x" }.map { Int($0)! }


        var earliestBus = (Int.max, 0)
        for bus in buses {
            let remainder = timestamp % bus
            let time = bus - remainder
            if time < earliestBus.0 {
                earliestBus = (time, bus)
            }
        }

        print(earliestBus.0 * earliestBus.1)
        
    }

    func part2() {
        let lines = input.components(separatedBy: .newlines)
        let buses = lines[1].components(separatedBy: ",").map {
            $0 == "x" ? 1 : Int($0)!
        }

        var inc = buses.first!
        var index = 1
        var t = inc
        while index < buses.count {
             if (t + index) % buses[index]  == 0 {
                 inc *= buses[index]
                 index += 1
             } else {
                 t += inc
             }
         }

        print(t)
    }

    part2()
}

fileprivate let input = """
1006697
13,x,x,41,x,x,x,x,x,x,x,x,x,641,x,x,x,x,x,x,x,x,x,x,x,19,x,x,x,x,17,x,x,x,x,x,x,x,x,x,x,x,29,x,661,x,x,x,x,x,37,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,23
"""
