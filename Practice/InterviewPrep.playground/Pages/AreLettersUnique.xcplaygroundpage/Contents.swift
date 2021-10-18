/* Write a function that accepts a String as its only parameter, and returns true if the string has
 only unique letters, taking letter case into account.
 Sample input and output
 • The string “No duplicates” should return true.
 • The string “abcdefghijklmnopqrstuvwxyz” should return true.
 • The string “AaBbCc” should return true because the challenge is case-sensitive.
 • The string “Hello, world” should return false because of the double Ls and double Os.
 */

/* Solution:
 The naive approach: Iterating through the entire string and checking to see if we have seen a specific character, is yes, then we return false.
 
 Better approach is to use a set to see if the count is still the same as the original string
 
 */

import UIKit

func hasUniqueLetters(_ str: String) -> Bool {
    guard str.count != 0 else { return false }
    
    return Set(str).count == str.count
}

hasUniqueLetters("No duplicates")  // true
hasUniqueLetters("Hello, world") // false
assert(hasUniqueLetters("No duplicates") == true, "Challenge 1 failed")
assert(hasUniqueLetters("abcdefghijklmnopqrstuvwxyz") == true,
"Challenge 1 failed")
assert(hasUniqueLetters("AaBbCc") == true, "Challenge 1 failed")
assert(hasUniqueLetters("Hello, world") == false, "Challenge 1failed")
