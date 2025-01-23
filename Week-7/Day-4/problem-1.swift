class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        
        func backtrack(_ start: Int, _ target: Int, _ combination: [Int]) {
            if target == 0 {
                result.append(combination)
                return
            }
            for i in start..<candidates.count {
                if candidates[i] > target { continue }
                backtrack(i, target - candidates[i], combination + [candidates[i]])
            }
        }
        
        backtrack(0, target, [])
        return result
    }
}
