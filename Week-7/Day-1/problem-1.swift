class Solution {
    func makeEqual(_ words: [String]) -> Bool {
        var count = [Int](repeating: 0, count: 26)
        for word in words {
            for char in word {
                count[Int(char.asciiValue! - 97)] += 1
            }
        }
        return count.allSatisfy { $0 % words.count == 0 }
    }
}
