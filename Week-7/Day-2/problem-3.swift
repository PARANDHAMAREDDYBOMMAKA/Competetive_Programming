class Solution {
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var sum = nums.prefix(k).reduce(0, +)
        var maxSum = sum
        
        for i in k..<nums.count {
            sum += nums[i] - nums[i - k]
            maxSum = max(maxSum, sum)
        }
        
        return Double(maxSum) / Double(k)
    }
}
