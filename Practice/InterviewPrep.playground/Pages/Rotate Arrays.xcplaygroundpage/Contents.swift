/*
 Rotate array to right N times.
 https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/
 
 For example, given

     A = [3, 8, 9, 7, 6]
     K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:

     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
     [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
     [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]

 */


func rotateOnce(A: [Int]) -> [Int] {
    var rotatedArray = Array(repeating: 0, count: A.count) // create a new array with default Zeroes and with A.count
    
    for i in 0..<A.count - 1 {   // O(n) - iterate through the array, replace zero at the i+1 position with A[i]
        rotatedArray[i + 1] = A[i]
    }
    
    rotatedArray[0] = A.last! // insert the last element of the array at position zero.
    
    return rotatedArray
}

rotateOnce(A:  [1, 2, 3, 4, 5])

func solution(A: [Int], K: Int) -> [Int] {  // O(n) + O(n)
    var resultsArray = A
    
    for _ in 1...K {  // O(n)
        resultsArray = rotateOnce(A: resultsArray)
    }
    return resultsArray
}

solution(A: [1, 2, 3, 4, 5], K: 1) // 5 1 2 3 4
solution(A: [1, 2, 3, 4, 5], K: 2) // 4 5 1 2 3
solution(A: [1, 2, 3, 4, 5], K: 3) // 3 4 5 1 2

solution(A: [3, 8, 9, 7, 6], K: 3) // [9, 7, 6, 3, 8]

