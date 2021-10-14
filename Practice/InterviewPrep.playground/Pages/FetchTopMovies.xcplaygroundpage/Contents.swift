import Foundation

/*  Problem:
need to build a criterion so the top movies from multiple countries will combine into a single list of top-rated movies. In order to scale, the content search is performed in a distributed fashion. Search results for each country are produced in separate lists. Each member of a given list is ranked by popularity, with 1 being most popular and popularity decreasing as the rank number increases
 
 Solution:
 
 Let’s discuss how we will implement this process:

 Consider the first list as the result, and store it in a variable.

 Traverse the list of lists, starting from the second list, and combine it with the list we stored as a result. The result should get stored in the same variable.

 When combining the two lists, like l1 and l2, maintain a prev pointer that points to a dummy node.

 If the value for list l1 is less than or equal to the value for list l2, connect the previous node to l1 and increment l1. Otherwise, do the same but for list l2.

 Keep repeating the above step until one list points to a null value.

 Connect the non-null list to the merged one and return.

 */


class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
    
    
    func printList() {

        var currentNode = self
        print(data)
        while currentNode.next != nil {
            currentNode = currentNode.next!
            print(currentNode.data)
        }
    }
}

class LinkList {
    var head: Node?
    
    func addFront(_ data: Int) {
        let newNode = Node(data)
        newNode.next = head
        head = newNode
    }
    
    func getFirst() -> Int? {
        if head == nil {
            return nil
        }
        return head!.data
    }
        
    func addBack(_ data: Int) {
        let newNode = Node(data)
        
        if head == nil {
            head = newNode
            return
        }

        var node = head!
        while(node.next != nil) {
            node = node.next!
        }
        node.next = newNode
    }

    func getLast() -> Int? {
        if head == nil {
            return nil
        }

        var node = head!
        while(node.next != nil) {
            node = node.next!
        }
        return node.data
    }

    func insert(position: Int, data: Int) {
        if position == 0 {
            addFront(data)
            return
        }
            
        let newNode = Node(data)
        var currentNode = head

        for _ in 0..<position - 1{
            currentNode = currentNode?.next!
        }
        newNode.next = currentNode?.next
        currentNode?.next = newNode
    }
    
    func deleteFirst() {
        head = head?.next
    }
    
    func delete(at position: Int) {
        if position == 0 {
            self.deleteFirst()
            return
        }
        
        var nextNode = head
        var previousNode: Node?
        for _ in 0..<position {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        previousNode?.next = nextNode?.next
    }

    func deleteLast() {
        if head?.next == nil {
            head = nil
            return
        }

        var nextNode = head
        var previousNode: Node?
        while(nextNode?.next != nil) {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        previousNode?.next = nil
    }
    
    func delete(data: Int) {
        if head == nil { return }
        if head!.data == data {
            head = head?.next
        }
        
        let current = head
        while current?.next != nil {
            if current?.next?.data == data {
                current?.next = current?.next?.next
                return
            }
        }
    }

    var isEmpty: Bool {
        return head == nil
    }
    
    func clear() {
        head = nil
    }

    func printLinkedList() {
        if head == nil {
            print("Empty")
            return
        }
        
        var result = [Int]()
        var node = head
        result.append(node!.data)
        
        while node?.next != nil {
            result.append(node!.next!.data)
            node = node?.next
        }
        
        print(result)
    }
}

let linkedList1 = LinkList()

linkedList1.addBack(41)
linkedList1.addBack(51)
linkedList1.addFront(11)
linkedList1.printLinkedList()

let linkedList2 = LinkList()

linkedList2.addBack(23)
linkedList2.addBack(42)
linkedList2.addFront(21)
linkedList2.addFront(9)


linkedList2.printLinkedList()


func combineTwoLists(_ list1: LinkList , _ list2: LinkList) {
    if list1.isEmpty && !list2.isEmpty {
        list2.printLinkedList()
    } else if  !list1.isEmpty && list2.isEmpty  {
        list1.printLinkedList
    } else if list1.isEmpty && list2.isEmpty {
        print("It's empty")
    }
    
    var node1 = list1.head
    var node2 = list2.head
    var mergedNode: Node?
    
    if node1!.data < node2!.data {
        mergedNode = node1
        node1 = node1?.next
    } else {
        mergedNode = node2
        node2 = node2?.next
    }
    
    var mergedTail = mergedNode
    
    while node1 != nil && node2 != nil {
        
        var tempNode: Node?
        
        if node1!.data < node2!.data {
            tempNode = node1
            node1 = node1?.next
        } else {
           tempNode = node2
            node2 = node2?.next
        }
        
        mergedTail?.next = tempNode
        mergedTail = tempNode
    }
    
    // check if there are any remaining nodes on each list
    
    if node1 != nil {
        mergedTail?.next = node1
    }
    
    if node2 != nil {
        mergedTail?.next = node2
    }
    
    mergedNode?.printList()
}

combineTwoLists(linkedList1, linkedList2)
