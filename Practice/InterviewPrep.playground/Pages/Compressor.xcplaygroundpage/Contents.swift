import UIKit

/*
 ___
/ __|___ _ __  _ __ _ _ ___ ______ ___ _ _
|(__/ _ \ '  \| '_ \ '_/ -_|_-<_-</ _ \ '_|
\___\___/_|_|_| .__/_| \___/__/__/\___/_|
              |_|
 
 // Challenge: Give a string with repeating characters (i.e. "aaabb") write
 // an algorithm that will compress the string down to the character, followed
 // by the number of times it appears in the string (i.e "a3b2").
 // If the compressed string is not smaller than original, return original.

 */

func compress(_ str: String) -> String {
    guard str.count > 0 else { return str }
    
    let characters = Array(str)
    
    var count = 0
    
    var lastChar: String = String(characters.first!)
    characters.dropFirst()
    
    var result = ""
    
    for currentCharacter in characters {
        if lastChar != String(currentCharacter) {
            result += String(lastChar)
            result += String(count)
            count = 1
            lastChar = String(currentCharacter)
        } else {
            count += 1
        }
    }
    
    if count >= 1 {
        result += lastChar
        result += String(count)
    }
    
    return result.count >= str.count ? str : result
}

compress("aaabb")           // a3b2
compress("aabb")            // aabb
compress("ab")              // ab
compress("abc")             // abc
compress("zzz")             // z3
compress("aabbaabb")        // aabbaabb (not shorter)
