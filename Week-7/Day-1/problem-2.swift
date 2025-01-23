class Solution {
    func kSimilarity(_ A: String, _ B: String) -> Int {
        var visited = Set<String>()
        var queue: [(String, Int)] = [(A, 0)]
        visited.insert(A)
        
        while !queue.isEmpty {
            let (current, step) = queue.removeFirst()
            if current == B { return step }
            
            var chars = Array(current)
            for i in 0..<chars.count {
                if chars[i] == B[i] { continue }
                for j in i+1..<chars.count where chars[j] == B[i] && chars[j] != B[j] {
                    chars.swapAt(i, j)
                    let newStr = String(chars)
                    if !visited.contains(newStr) {
                        visited.insert(newStr)
                        queue.append((newStr, step + 1))
                    }
                    chars.swapAt(i, j)
                }
            }
        }
        return -1
    }
}
