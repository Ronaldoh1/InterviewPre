/*
 
 Write a function that accepts a string, and returns how many times a specific character appears,
 taking case into account.
 
 Tip: If you can solve this without using a for-in loop, you can consider it a Tricky challenge.
 Sample input and output
 
 • The letter “a” appears twice in “The rain in Spain”.
 • The letter “i” appears four times in “Mississippi”.
 • The letter “i” appears three times in “Hacking with Swift”.

 
 */

import Foundation

func countCharacters(_ input: String, count: Character) -> Int {
    guard input.count > 0 else { return 0 }
    
    let array = Array(input)
    let counted = NSCountedSet(array: array)
    return counted.count(for: count)
}


countCharacters("Mississippi", count: "i") // four times. 
