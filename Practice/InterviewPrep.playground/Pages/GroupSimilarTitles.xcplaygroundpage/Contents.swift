import UIKit
import Foundation

// Solution
// compute 26 element vector - this will generate identical vectors for strings that are anagrams.
// use vector as key to insert titles into hash map.
// when user searches a word, compute 26 element frequency vector and return all the map entries.
// store all the calculated character counts in the same Hash Map as a key and assing the respective anagram as its value.
// return the values of the has map since each vaue will be an individual set

func groupSimilarTitles(_ titles: [String]) -> [[String]] {
    var groupedTitles =  [[Int]: [String]]()
    
    for title in titles {
        var frequencies = Array(repeating: 0, count: 26)

        for char in title.unicodeScalars {
            switch char {
            case "a"..."z":
                let index = Int(char.value - UnicodeScalar("a").value) //calculates the index of the latter, index tells us where in the array we need to replace value
                let value =  frequencies[index]
                frequencies[index] = value + 1
            default: break
            }
        }
        
        let key = frequencies
        
        if var similarTitles = groupedTitles[key] {
            similarTitles.append(title)
            groupedTitles[key] = similarTitles
        } else {
            groupedTitles[key] = [title]
        }
    }
    
    return groupedTitles.values.map { $0 }
}



let tiles = ["duel","dule","speed","spede","deul","cars"]

let groupedTitles = groupSimilarTitles(tiles)

var query = "spede"

let results = groupedTitles.flatMap {
    $0.contains(query) ? $0 : []
}

print(results)
