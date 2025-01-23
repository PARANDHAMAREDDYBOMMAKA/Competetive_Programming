class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var prefixSum = 0
        var sumMap = [0: 1]
        
        for num in nums {
            prefixSum += num
            count += sumMap[prefixSum - k, default: 0]
            sumMap[prefixSum, default: 0] += 1
        }
        
        return count
    }
}
