class Solution {
    func alienOrder(_ words: [String]) -> String {
        var graph = [Character: Set<Character>]()
        var inDegree = [Character: Int]()
        
        for word in words {
            for char in word {
                inDegree[char] = 0
            }
        }
        
        for i in 0..<words.count - 1 {
            let word1 = words[i], word2 = words[i + 1]
            var minLength = min(word1.count, word2.count)
            var found = false
            for j in 0..<minLength {
                let c1 = word1[word1.index(word1.startIndex, offsetBy: j)]
                let c2 = word2[word2.index(word2.startIndex, offsetBy: j)]
                if c1 != c2 {
                    if !graph[c1, default: []].contains(c2) {
                        graph[c1, default: []].insert(c2)
                        inDegree[c2, default: 0] += 1
                    }
                    found = true
                    break
                }
            }
            if !found && word1.count > word2.count {
                return ""
            }
        }
        
        var queue = [Character]()
        for (key, value) in inDegree {
            if value == 0 {
                queue.append(key)
            }
        }
        
        var result = ""
        while !queue.isEmpty {
            let char = queue.removeFirst()
            result.append(char)
            if let neighbors = graph[char] {
                for neighbor in neighbors {
                    inDegree[neighbor]! -= 1
                    if inDegree[neighbor] == 0 {
                        queue.append(neighbor)
                    }
                }
            }
        }
        
        return result.count == inDegree.count ? result : ""
    }
}
