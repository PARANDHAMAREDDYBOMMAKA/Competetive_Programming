class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var current = [Int]()
        var visited = Array(repeating: false, count: nums.count)
        
        func backtrack() {
            if current.count == nums.count {
                result.append(current)
                return
            }
            
            for i in 0..<nums.count {
                if visited[i] { continue }
                visited[i] = true
                current.append(nums[i])
                backtrack()
                current.removeLast()
                visited[i] = false
            }
        }
        
        backtrack()
        return result
    }
}
