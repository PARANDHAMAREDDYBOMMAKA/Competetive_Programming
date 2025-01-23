class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        let wordList = Set(wordList)
        if !wordList.contains(endWord) { return 0 }
        
        var queue = [(beginWord, 1)]
        var visited = Set([beginWord])
        
        while !queue.isEmpty {
            let (word, length) = queue.removeFirst()
            for i in 0..<word.count {
                var newWord = Array(word)
                for c in "abcdefghijklmnopqrstuvwxyz" {
                    newWord[i] = c
                    let newWordStr = String(newWord)
                    if newWordStr == endWord {
                        return length + 1
                    }
                    if wordList.contains(newWordStr) && !visited.contains(newWordStr) {
                        queue.append((newWordStr, length + 1))
                        visited.insert(newWordStr)
                    }
                }
            }
        }
        
        return 0
    }
}
