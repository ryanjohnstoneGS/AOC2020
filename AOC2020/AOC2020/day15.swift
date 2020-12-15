//
//  day15.swift
//  AOC2020
//
//  Created by Ryan Johnstone on 15/12/2020.
//

import Foundation

func day15() {
    func part1() {
        getNumberSpoken(number: 2020)
    }

    func part2() {
        getNumberSpoken(number: 30000000)
    }

    func getNumberSpoken(number: Int) {
        let numbers = input.components(separatedBy: ",").map { Int($0)! }
        var turns: [Int: Int] = [:]

        var i = 1
        var currentNumber = 0
        repeat {
            if numbers.indices.contains(i - 1) {
                let newNumber = numbers[i - 1]
                turns[newNumber] = i
                currentNumber = newNumber
            } else {
                let lastRound = turns[currentNumber]
                var newNumber = 0

                if let lastRound = lastRound {
                    newNumber = i - 1 - lastRound
                }

                turns[currentNumber] = i - 1
                currentNumber = newNumber
            }
            i += 1
        } while i <= number

        print(currentNumber)
    }

    part1()
    part2()
}

fileprivate let input = """
2,0,1,9,5,19
"""
