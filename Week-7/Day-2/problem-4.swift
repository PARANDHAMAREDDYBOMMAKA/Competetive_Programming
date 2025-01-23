class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var count = [Int](repeating: 0, count: 26)
        var left = 0
        var maxCount = 0
        var result = 0
        
        for right in 0..<s.count {
            let rightChar = Int(s[s.index(s.startIndex, offsetBy: right)].asciiValue! - 65)
            count[rightChar] += 1
            maxCount = max(maxCount, count[rightChar])
            
            if right - left + 1 - maxCount > k {
                let leftChar = Int(s[s.index(s.startIndex, offsetBy: left)].asciiValue! - 65)
                count[leftChar] -= 1
                left += 1
            }
            
            result = max(result, right - left + 1)
        }
        
        return result
    }
}
