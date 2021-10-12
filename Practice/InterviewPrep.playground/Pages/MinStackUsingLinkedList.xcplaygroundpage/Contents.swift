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
    private class Node {
        var next: Node?
        var data: Int
        var currentMin: Int
        init(data: Int, currentMin: Int, next: Node? = nil) {
            self.data = data
            self.currentMin = currentMin
        }
    }
    
    private var head: Node?
    
    func push(_ data: Int) {
        var currentMin = data
        
        if head != nil {
            currentMin = Swift.min(data, min()!)
        }
        let node = Node(data: data, currentMin: currentMin)
        node.next = head
        head = node
    }
    
    func pop() -> Int? {
        let data = head?.data
        head = head?.next
        return data
    }

    func min() -> Int? {
        return head?.currentMin
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


