import UIKit

/*
 __  __ _           _           _
|  \/  (_)_ _    __| |_ __ _ __| |__
| |\/| | | ' \  (_-<  _/ _` / _| / /
|_|  |_|_|_||_| /__/\__\__,_\__|_\_\

 // Challenge: Design a stack which, in addition to push and pop, has a function
 // 'min' which returns the minimum element? Push, pop and min should all operate in
 // O(1) time.

 */
class MinStack {
    var stack = [Int]()
    var minStack = [Int]()
    
    func push(_ data: Int) {
        stack.append(data)
        
        if minStack.isEmpty || data < minStack.last! {
            minStack.append(data)
        }
    }
    
    func pop() {
        guard !stack.isEmpty else { return }
        let value = stack.removeLast()
        
        if let last = minStack.last, last == value {
            minStack.removeLast()
        }
    }
    
    func top() -> Int? {
        return stack.last
    }
    
    func min() -> Int? {
        return minStack.last
    }
}

var stack = MinStack() // Create this how ever you want...

stack.push(5)
stack.push(6)
stack.push(3)
stack.push(7)
stack.min()       // 3
stack.pop()
stack.min()       // 3
stack.pop()
stack.min()       // 5


