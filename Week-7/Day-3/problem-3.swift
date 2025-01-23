class Solution {
    func isMonotonic(_ nums: [Int]) -> Bool {
        var increasing = true
        var decreasing = true
        
        for i in 1..<nums.count {
            if nums[i] > nums[i - 1] {
                decreasing = false
            }
            if nums[i] < nums[i - 1] {
                increasing = false
            }
        }
        
        return increasing || decreasing
    }
}
