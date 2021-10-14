/*
 
 Problem:
 We want to implement a feature so that the user can view the n titles that they’ve watched or accessed most recently. You need to come up with a data structure for this feature. Let’s break it down. If we think it through, we realize the following: i) This data structure should maintain titles in order of time since last access; ii) If the data structure is at its capacity, an insertion should replace the least recently accessed item.
 
 Solution:
 
 A doubly linked list provides an ideal way of maintaining ordered elements. We can keep the most recently accessed item at the tail. But when a recently watched item is accessed again, we’ll move it to the tail of the linked list. This will require searching for an element in the linked list, which is expensive. To fix this, we can use a hash table to store the pointers of the linked list elements.

 Here’s how we implement the feature:

 If the element exists in the hashmap, our first step is to move the accessed element to the tail of the linked list

 If the data structure is at its capacity, remove the element at the head of the linked list and the Hash Map. Then, we add the new element at the tail of the linked list and in the Hash Map

 Finally, we retrieve the element and return


 */


class Node<T: Equatable>: Equatable {
    var value: T
    var next: Node<T>? = nil
    var prev: Node<T>? = nil
    
    init(value: T) {
        self.value = value
    }
    
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value
    }
}


class DoublyLinkedList<T: Equatable> {
    var head: Node<T>? = nil
    var tail: Node<T>? = nil
    var size: Int = 0
    
    func append(value: T) {
        // 1
        let newNode = Node(value: value)

        // 2
        guard self.head != nil else {
            // 3
            self.head = newNode
            self.tail = newNode
            self.size += 1
            return
        }
      
        // 4
        self.tail?.next = newNode
        newNode.prev = self.tail
        self.tail = newNode
        
        // 5
        self.size += 1
    }
    
    func prepend(value: T) {
        // 1
        let newNode = Node(value: value)
        
        // 2
        guard self.head != nil else {
            // 3
            self.head = newNode
            self.tail = newNode
            self.size += 1
            return
        }

        // 4
        self.head?.prev = newNode
        newNode.next = self.head
        self.head = newNode
        
        // 5
        self.size += 1
    }
    
    func items() -> [T?] {
        // 1
        guard self.head != nil else {
            return []
        }
        
        // 2
        var allItems = [T]()
        var curr = self.head
        
        // 3
        while curr != nil {
            allItems.append(curr!.value)
            curr = curr?.next
        }
        
        // 4
        return allItems
    }
    
    func insertAtIndex(_ value: T, atIndex: Int) {
        // 1.
        guard atIndex >= 0 && atIndex <= self.size else {
            print("Error, index out of bounds")
            return
        }

        // 2.
        if atIndex == 0 {
            self.prepend(value)
          
        // 3.
        } else if atIndex == self.size {
            self.append(value)
          
        // 4.
        } else {
            // 1
            let newNode = Node(value: value)
            // 2
            var curr = self.head
            for _ in 0..<atIndex {
                curr = curr?.next
            }
            // 3
            curr?.prev?.next = newNode
            newNode.prev = curr?.prev
            curr?.prev = newNode
            newNode.next = curr
            // 4
            self.size += 1
        }
    }
    
    func getAtIndex(_ index: Int) -> T? {
        // 1
        guard index >= 0 && index <= self.size else {
            print("Error, index out of bounds")
            return nil
        }
        
        // 2
        var curr = self.head
        for _ in 0..<index {
            curr = curr?.next
        }
        
        // 3
        return curr?.value
    }
    
    
}


class MovieCache  {
    
    private var cache = [Node: Int]()
    
    private var capacity: Int
    
    private var movies = DoublyLinkedList<Int>()
    
    init(capacity: Int) {
        self.capacity = capacity
    }
    
    //check if the movie is in the cache, if it is, add it to the tail but remove it from the list
    func setMovie(id: Int) {
        if let movie = cache[id] {
            movies.remove
        }
    }
    
}
