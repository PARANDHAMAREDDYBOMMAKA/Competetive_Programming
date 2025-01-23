class Solution {
    func alienOrder(_ words: [String]) -> String {
        var graph = [Character: Set<Character>]()
        var inDegree = [Character: Int]()
        
        for word in words {
            for char in word {
                inDegree[char, default: 0] = 0
                graph[char, default: Set()] = Set()
            }
        }
        
        for i in 0..<words.count - 1 {
            let word1 = words[i], word2 = words[i + 1]
            var j = 0
            while j < min(word1.count, word2.count), Array(word1)[j] == Array(word2)[j] {
                j += 1
            }
            if j < min(word1.count, word2.count) {
                let from = Array(word1)[j], to = Array(word2)[j]
                if !graph[from]!.contains(to) {
                    graph[from]!.insert(to)
                    inDegree[to]! += 1
                }
            }
        }
        
        var queue = [Character]()
        for (node, degree) in inDegree {
            if degree == 0 {
                queue.append(node)
            }
        }
        
        var result = ""
        while !queue.isEmpty {
            let node = queue.removeFirst()
            result.append(node)
            for neighbor in graph[node]! {
                inDegree[neighbor]! -= 1
                if inDegree[neighbor]! == 0 {
                    queue.append(neighbor)
                }
            }
        }
        
        return result.count == inDegree.count ? result : ""
    }
}
