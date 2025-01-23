class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var maxReach = 0
        for (i, num) in nums.enumerated() {
            if i > maxReach { return false }
            maxReach = max(maxReach, i + num)
        }
        return true
    }
}
