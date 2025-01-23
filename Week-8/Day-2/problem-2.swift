class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        var lastIndex = [Character: Int]()
        for (i, c) in S.enumerated() {
            lastIndex[c] = i
        }
        
        var result = [Int]()
        var start = 0, end = 0
        
        for (i, c) in S.enumerated() {
            end = max(end, lastIndex[c]!)
            if i == end {
                result.append(i - start + 1)
                start = i + 1
            }
        }
        
        return result
    }
}
