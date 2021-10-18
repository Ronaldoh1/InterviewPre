/*
 Write a function that accepts a string as its input, and returns the same string just with
 duplicate letters removed.
 Tip: If you can solve this challenge without a for-in loop, you can consider it “tricky” rather than “easy”.
 Sample input and output
 • The string “wombat” should print “wombat”. • The string “hello” should print “helo”.
 • The string “Mississippi” should print “Misp”.
 
 */

import Foundation

    func removeDuplicateCharacters(_ input: String) -> String {
        guard input.count > 0 else { return input }
        let array = input.map { String($0) }
        let orderedSet = NSOrderedSet(array: array)
        let letters = Array(orderedSet) as! Array<String>
        return letters.joined()
    }
    

removeDuplicateCharacters("Mississippi")
