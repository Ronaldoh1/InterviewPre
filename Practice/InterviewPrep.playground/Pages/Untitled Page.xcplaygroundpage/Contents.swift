// you can write to stdout for debugging purposes, e.g.
print("This is a debug message")

func encryptMessage(_ message: String, keys: [Int]) -> String {
    guard message.count > 0 else { return message }
    guard !keys.isEmpty else { return message }

    // map the message into an array.
    
    var encryptedMessage = Array(0, count: message.count)

    for key in keys {    // O(m)
        
        for i = key in 0..<message.count { // O(n)
            if message.charAtIndex(i) == " " {
               encryptedMessage.append("$")

            } else {
               encryptedMessage.append(message.charAtIndex(i))
            }
            i += key
        }
         
    }


    return String(encryptedMessage)
}
