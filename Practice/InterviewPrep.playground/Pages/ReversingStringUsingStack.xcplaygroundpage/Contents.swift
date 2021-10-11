import UIKit
import Darwin

// https://www.fullstack.cafe/interview-questions/stacks

/*
 Giving a String, write a function that reserves the String
 using a stack.
 */
// using a stack, this means it's a first in, last out datastructure
// convert the string to an array of characters, then we can we can use a separate stack to reverse it

func solution(_ text: String) -> String {
    guard !text.isEmpty else { return "" }
    var characters = Array(text)
    var stack = [Character]()
    
    for i in 0..<characters.count {
        stack.append(characters[i])
    }
    
    var result = ""
    
    for i in 0..<stack.count {

        result += String(stack.popLast()!)
        print(result)
    }
    
    return result
}

solution("abc") // bca
solution("Would you like to play a game?")
