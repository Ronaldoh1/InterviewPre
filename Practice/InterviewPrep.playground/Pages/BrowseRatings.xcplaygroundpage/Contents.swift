struct Stack<T> {
    
    private var items = [T]()
    
    var isEmpty: Bool {
        return items.count == 0
    }
    
    func top() -> T? {
        guard !isEmpty else { return nil }
        return items.last
    }
    
    func size() -> Int {
        return items.count
    }
    
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    func pop() -> T? {
        if !isEmpty {
            return items[0]
        }
    return nil
    }
    
}


struct MaxStack {
    
    private var stack = [Int]()
    private var max_stack = [Int]()
    
    func size() -> Int {
        return stack.count
    }
    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    
    mutating func push(_ item: Int) {
        if max_stack.isEmpty {
            max_stack.append(item)
        } else if item > max_stack.last! {
            max_stack.append(item)
            stack.append(item)
        } else {
            stack.append(item)
        }
    }
    
    func currentMax() -> Int {
        return max_stack.last!
    }
    
    mutating func pop() -> Int? {
        guard !isEmpty() else { return nil }
        let value = stack.popLast()!
        if value == max_stack.last! {
            max_stack.popLast()!
        }
        return value
    }
}


var ratings = MaxStack()

ratings.push(5)
ratings.push(0)
ratings.push(2)
ratings.push(4)
ratings.push(6)
ratings.push(3)
ratings.push(10)

ratings.currentMax()
