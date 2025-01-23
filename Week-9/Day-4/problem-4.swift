class Solution {
    func alienOrder(_ words: [String]) -> String {
        var graph = [Character: Set<Character>]()
        var indegree = [Character: Int]()
        
        for word in words {
            for char in word {
                indegree[char] = 0
            }
        }
        
        for i in 1..<words.count {
            let word1 = words[i-1], word2 = words[i]
            var foundDifference = false
            for j in 0..<min(word1.count, word2.count) {
                let char1 = word1[word1.index(word1.startIndex, offsetBy: j)]
                let char2 = word2[word2.index(word2.startIndex, offsetBy: j)]
                
                if char1 != char2 {
                    if !graph[char1, default: Set()].contains(char2) {
                        graph[char1, default: Set()].insert(char2)
                        indegree[char2, default: 0] += 1
                    }
                    foundDifference = true
                    break
                }
            }
            if !foundDifference && word1.count > word2.count {
                return ""
            }
        }
        
        var queue = [Character]()
        for (char, degree) in indegree where degree == 0 {
            queue.append(char)
        }
        
        var result = ""
        while !queue.isEmpty {
            let char = queue.removeFirst()
            result.append(char)
            
            if let neighbors = graph[char] {
                for neighbor in neighbors {
                    indegree[neighbor]! -= 1
                    if indegree[neighbor] == 0 {
                        queue.append(neighbor)
                    }
                }
            }
        }
        
        return result.count == indegree.count ? result : ""
    }
}
