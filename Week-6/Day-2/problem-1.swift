class Solution {
    func countVowelStrings(_ n: Int) -> Int {
        var dp = [1, 1, 1, 1, 1]
        
        for _ in 1..<n {
            for i in (1..<5).reversed() {
                dp[i] += dp[i - 1]
            }
        }
        
        return dp.reduce(0, +)
    }
}
