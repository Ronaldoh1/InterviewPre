/*
 
 Write a function that accepts two String parameters, and returns true if they contain the same
 characters in any order taking into account letter case.
 
 Sample input and output
 • The strings “abca” and “abca” should return true.
 • The strings “abc” and “cba” should return true.
 • The strings “ a1 b2 ” and “ b1 a2 ” should return true.
 • The strings “abc” and “abca” should return false.
 • The strings “abc” and “Abc” should return false.
 • The strings “abc” and “cbAa” should return false.
 • The strings “abcc” and “abca” should return false.

 
 Solution:
 
 Naive: check if string contains every character of the other string. If no, return false.
 
 Optimal: Use a set and ensure their counts are the same
 
 */

func BruteForceDoStringsContainSameCharacters(_ input1: String, _ input2: String) -> Bool {
    var checkString = input2
    for letter in input1 {
       if let index = checkString.firstIndex(of: letter) {
          checkString.remove(at: index)
       } else {
          return false
       }
 }
    return checkString.count == 0
 }

func doStringsContainSameCharacters(_ input1: String, _ input2: String) -> Bool {
    return input1.sorted() == input2.sorted()
}


doStringsContainSameCharacters("abca", "abca") // true
doStringsContainSameCharacters("abc" , "cba") // true
doStringsContainSameCharacters("abc", "abca") // false
doStringsContainSameCharacters("abcc", "abca") // false
