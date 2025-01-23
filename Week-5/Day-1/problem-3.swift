class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var left = 0
        var sum = 0
        var result = Int.max
        for right in 0..<nums.count {
            sum += nums[right]
            while sum >= target {
                result = min(result, right - left + 1)
                sum -= nums[left]
                left += 1
            }
        }
        return result == Int.max ? 0 : result
    }
}
