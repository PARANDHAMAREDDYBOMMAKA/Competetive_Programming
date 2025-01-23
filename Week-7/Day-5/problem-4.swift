class Solution {
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        var wordSet = Set(wordList)
        var results = [[String]]()
        var queue = [(beginWord, [beginWord])]
        var visited = Set([beginWord])
        var found = false
        
        while !queue.isEmpty && !found {
            var currentLevelVisited = Set<String>()
            var currentLevelQueue = [(String, [String])]()
            
            for (word, path) in queue {
                if word == endWord {
                    results.append(path)
                    found = true
                }
                for i in 0..<word.count {
                    let wordArray = Array(word)
                    for char in "abcdefghijklmnopqrstuvwxyz" {
                        var newWord = wordArray
                        newWord[i] = char
                        let newWordStr = String(newWord)
                        if wordSet.contains(newWordStr) && !visited.contains(newWordStr) {
                            currentLevelQueue.append((newWordStr, path + [newWordStr]))
                            currentLevelVisited.insert(newWordStr)
                        }
                    }
                }
            }
            
            visited.formUnion(currentLevelVisited)
            queue = currentLevelQueue
        }
        
        return results
    }
}
