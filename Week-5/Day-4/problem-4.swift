class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var result = [Int]()
        var deque = [Int]()
        
        for i in 0..<nums.count {
            if !deque.isEmpty && deque.first! < i - k + 1 {
                deque.removeFirst()
            }
            
            while !deque.isEmpty && nums[deque.last!] < nums[i] {
                deque.removeLast()
            }
            
            deque.append(i)
            
            if i >= k - 1 {
                result.append(nums[deque.first!])
            }
        }
        
        return result
    }
}
