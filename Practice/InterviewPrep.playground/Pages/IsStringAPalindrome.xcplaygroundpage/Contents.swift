/*
 Write a function that accepts a String as its only parameter, and returns true if the string reads
 the same when reversed, ignoring case.
 
 Sample input and output
 • The string “rotator” should return true.
 • The string “Rats live on no evil star” should return true.
 • The string “Never odd or even” should return false; even though the letters are the same in
 reverse the spaces are in different places.
 • The string “Hello, world” should return false because it reads “dlrow ,olleH” backwards.
 
 
 Solution: Naive approach, go through each letter and compare
 
 Better approach, reverse the string and use the compare ==
 
 */

import Foundation

func isAPalindrome(_ input: String) -> Bool {
    guard input.count >= 1 else { return false } // we want input to be greater than or = 1
    let lowerCased = input.lowercased()
    return String(lowerCased.reversed()) == lowerCased
 }


isAPalindrome("rotator")
isAPalindrome("Rats live on no evil star")
isAPalindrome("Hello, world")
