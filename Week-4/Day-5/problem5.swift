class Solution {
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        let sum = nums.reduce(0, +)
        if sum % k != 0 { return false }
        let target = sum / k
        var subsets = Array(repeating: 0, count: k)
        let sortedNums = nums.sorted(by: >)
        
        func backtrack(_ index: Int) -> Bool {
            if index == sortedNums.count { return subsets.allSatisfy { $0 == target } }
            for i in 0..<k {
                if subsets[i] + sortedNums[index] <= target {
                    subsets[i] += sortedNums[index]
                    if backtrack(index + 1) { return true }
                    subsets[i] -= sortedNums[index]
                }
            }
            return false
        }
        
        return backtrack(0)
    }
}
