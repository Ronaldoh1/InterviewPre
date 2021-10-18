/*
 
 Write your own version of the contains() method on String that ignores letter case, and
 without using the existing contains() method.
 
 Sample input and output
 • The code "Hello, world".fuzzyContains("Hello") should return true.
 • The code "Hello, world".fuzzyContains("WORLD") should return true. • The code "Hello, world".fuzzyContains("Goodbye") should return false.
 
 */
import Foundation

extension String {
    
    func fuzzyContains(_ input: String) -> Bool {
        guard input.count > 0 else { return false }
        return self.range(of: input, options: .caseInsensitive) !=
        nil
        
    }
    
}

"Hello, world".fuzzyContains("Hello")
"Hello, world".fuzzyContains("WORLD")
"Hello, world".fuzzyContains("Goodbye")
