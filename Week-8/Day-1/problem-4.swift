class Solution {
    func subarraysWithKDistinct(_ A: [Int], _ K: Int) -> Int {
        return atMostK(A, K) - atMostK(A, K - 1)
    }
    
    func atMostK(_ A: [Int], _ K: Int) -> Int {
        var count = [Int: Int]()
        var left = 0
        var result = 0
        
        for right in 0..<A.count {
            count[A[right], default: 0] += 1
            while count.count > K {
                count[A[left]]! -= 1
                if count[A[left]] == 0 {
                    count.removeValue(forKey: A[left])
                }
                left += 1
            }
            result += right - left + 1
        }
        
        return result
    }
}
