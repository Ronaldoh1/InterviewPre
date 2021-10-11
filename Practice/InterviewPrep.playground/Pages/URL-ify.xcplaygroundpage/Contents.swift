import UIKit

/*
 _   _ ___ _    _  __
| | | | _ \ |  (_)/ _|_  _
| |_| |   / |__| |  _| || |
 \___/|_|_\____|_|_|  \_, |
                      |__/

  Challenge: See if you can replace all the spaces in a a string with the
  ASCII symbol for space '%20'. Assume you are given the length of the final
  string. Hint: Use array of char[].

 */

func urlify(_ url: String, length: Int) -> String {
    guard !url.isEmpty else { return "" }
    
    var characters = Array(url)
    var urlString = ""
    for char in characters {
        guard urlString.count < length else { break }
        if char == " " {
            urlString += "%20"
        } else {
            urlString += String(char)
        }
    }
    
    return urlString
}

urlify("My Home Page    ", length: 16) // "My%20Home%20Page"

