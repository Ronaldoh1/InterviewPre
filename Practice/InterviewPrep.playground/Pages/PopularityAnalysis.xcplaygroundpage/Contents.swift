/* Netflix maintains a popularity score for each of its titles. This popularity score is derived from customer feedback, likes, dislikes, etc. This score is updated weekly and added to the end of the array containing previous scores for the same title. This score array helps Netflix identify titles that may be increasing or decreasing in popularity over time. Some titles may be steady in popularity, increasing, decreasing, and fluctuating. We want to identify and separate a title if it is gaining or losing popularity.
 
 We’ll be provided with an array of integers representing the popularity scores of a movie collected over a number of weeks. We need to identify only those titles that are either increasing or decreasing in popularity, so we can separate them from the fluctuating ones for better analysis.
 
 */


func determinePopularityRating(_ ratings: [Int]) -> (Bool, Bool)? {
    guard !ratings.isEmpty else { return nil }
    
    var isIncreasing = false
    var isDecreasing = false
    
    for i in 0..<ratings.count {
        guard i < ratings.count - 1 else { break }
        if ratings[i] < ratings[i + 1] {
            isIncreasing = true
        }
        
        if ratings[i] > ratings[i + 1] {
            isDecreasing = true
        }
    }
    
    return (isIncreasing, isDecreasing)
}


var movieRatings = [
    [1,2,2,3],
    [4,5,6,3,4],
    [8,8,7,6,5,4,4,1]
]


for rating in movieRatings {
    
    let popularity = determinePopularityRating(rating)!
    switch popularity {
    case (true, true): print("It's fluctuating")
    case (true, false): print("It's increasing")
    case (false, true): print("It's decreasing")
    case (false, false): print("It's fuctuating")
    }

}

