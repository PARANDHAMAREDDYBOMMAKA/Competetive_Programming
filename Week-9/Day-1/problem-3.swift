class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = [[]]
        var nums = nums.sorted()
        
        var current: [Int] = []
        
        func backtrack(_ index: Int) {
            for i in index..<nums.count {
                if i > index && nums[i] == nums[i-1] { continue }
                current.append(nums[i])
                result.append(current)
                backtrack(i+1)
                current.removeLast()
            }
        }
        
        backtrack(0)
        
        return result
    }
}
