class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        var count = [Character: Int]()
        var left = 0
        var maxCount = 0
        var maxLength = 0
        
        for right in 0..<s.count {
            let rightChar = s[s.index(s.startIndex, offsetBy: right)]
            count[rightChar, default: 0] += 1
            maxCount = max(maxCount, count[rightChar]!)
            
            if right - left + 1 - maxCount > k {
                let leftChar = s[s.index(s.startIndex, offsetBy: left)]
                count[leftChar]! -= 1
                left += 1
            }
            maxLength = max(maxLength, right - left + 1)
        }
        return maxLength
    }
}
