/*
 ___            _ _         _
|   \ _  _ _ __| (_)__ __ _| |_ ___ ___
| |) | || | '_ \ | / _/ _` |  _/ -_|_-<
|___/ \_,_| .__/_|_\__\__,_|\__\___/__/
          |_|

 // Challenge: Write a method that removes any duplicates from our Linked List.
 
 */

import Darwin

func printLinkedListSimple(_ head: Node?) {
    if head == nil { return }
    
    var node = head
    print(node!.data)
    
    while node?.next != nil {
        print(node!.next!.data)
        node = node?.next
    }
}

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func removeDuplictates(_ head: Node?) -> Node? {
    guard head != nil else { return nil }
    
    var previousNode: Node? = nil
    var currentNode:Node? = head
    
    var uniqueNumbers = [Int]()
    
    while currentNode != nil {
        if uniqueNumbers.contains(currentNode!.data) {
            previousNode?.next = currentNode?.next
        } else {
            uniqueNumbers.append(currentNode!.data)
            previousNode = currentNode
        }
        currentNode = currentNode?.next
    }
    
    return head
}

let node3 = Node(3)
let node2 = Node(2, node3)
let node1 = Node(1, node2)
node3.next = Node(1)        // duplicate
printLinkedListSimple(node1)
print("===")
removeDuplictates(node1)
printLinkedListSimple(node1)
