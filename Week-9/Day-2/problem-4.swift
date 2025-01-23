class Solution {
    func frequencySort(_ s: String) -> String {
        var countMap = [Character: Int]()
        for char in s {
            countMap[char, default: 0] += 1
        }
        
        let sortedChars = countMap.keys.sorted { countMap[$0]! > countMap[$1]! }
        
        var result = ""
        for char in sortedChars {
            result += String(repeating: char, count: countMap[char]!)
        }
        
        return result
    }
}
