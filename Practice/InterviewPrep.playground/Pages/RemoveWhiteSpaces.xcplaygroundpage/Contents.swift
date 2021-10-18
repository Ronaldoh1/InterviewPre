/*
 
 Write a function that returns a string with any consecutive spaces replaced with a single space.
 Sample input and output
 I’ve marked spaces using “[space]” below for visual purposes:
 • The string “a[space][space][space]b[space][space][space]c” should return “a[space]b[space]c”.
 • The string “[space][space][space][space]a” should return “[space]a”. • The string “abc” should return “abc”.

 */

func removeExtraWhiteSpaces(_ input: String) -> String {
    guard input.count > 0 else { return input }
    
    var seenSpace = true
    var resultString = ""
    
    for letter in input {
        if letter == " " {
            if seenSpace { continue }
            seenSpace = true
        } else {
            seenSpace = false
        }
        
        resultString.append(letter)
    }
    return resultString
}


removeExtraWhiteSpaces("This     is       awesome!")
