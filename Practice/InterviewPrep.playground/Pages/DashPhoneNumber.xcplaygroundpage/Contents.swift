import Foundation

/*
 We are given a string S representing a phone number, which we would like to reformat. String S consists of N characters: digits, spaces, and/or dashes. It contains at least two digits.
 
 Spaces and dashes in string S can be ignored. We want to reformat the given phone number is such a way that the digits are grouped in blocks of length three, separated by single dashes. If necessary, the final block or the last two blocks can be of length two.
 
 For example:
 
 S = "00-44   48 5555 8361" should become
     "004-448-555-583-61"
 
 Assume:
 - S consists only of digits (0-9), spaces, and/or dashses (-)
 - S containts at least two digits
 
 Translate:
 
 Would like to reformat a phone number string so that:
 - every third char is a "-"
 - spaces and dashes don't matter
 - if the block ends in anything other than -xxx or -xx reformat to a block of two like xx-xx (not obvious)
 
 */
func solution(_ S : String) -> String {
    guard S.count != 0 else { return "" }
    
    let noSpace = S.replacingOccurrences(of: " ", with: "")
    let noSpaceNoDash = noSpace.replacingOccurrences(of: "-", with: "")
    
    var resultString = ""
    
    var numbers = Array(noSpaceNoDash)
    var count = 0
    for number in numbers {
        if count == 3 {
            resultString += "-"
            count = 0
        }
        
        resultString += String(number)
        count += 1
    
    }
    
    // if the last item is dash - strip it off
    
    if resultString.last == "-" {
        resultString.dropLast()
    }
    
    //if the second to last character has a dash -x, reformat last 3 characters to be -xx
    
    var chars = Array(resultString)
    let secondToLast = chars.count - 2
    if chars[secondToLast] == "-" {
        chars[secondToLast] = chars[secondToLast - 1]
        chars[secondToLast - 1] = "-"
    }
    resultString = String(chars)
    return resultString
}

solution("123456789")           // 123-456-789
solution("555372654")           // 555-372-654
solution("0 - 22 1985--324")    // 022-198-53-24

// Edge cases
solution("01")                          // 01
solution("012")                         // 012
solution("0123")                        // 01-23
solution("0123       444")              // 012-34-44
solution("------0123       444")        // 012-34-44
