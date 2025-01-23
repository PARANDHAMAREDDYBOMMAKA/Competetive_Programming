class WordDictionary {
    class TrieNode {
        var children: [Character: TrieNode] = [:]
        var isWord = false
    }
    
    private var root: TrieNode
    
    init() {
        root = TrieNode()
    }
    
    func addWord(_ word: String) {
        var node = root
        for char in word {
            if node.children[char] == nil {
                node.children[char] = TrieNode()
            }
            node = node.children[char]!
        }
        node.isWord = true
    }
    
    func search(_ word: String) -> Bool {
        return searchHelper(word, 0, root)
    }
    
    private func searchHelper(_ word: String, _ index: Int, _ node: TrieNode) -> Bool {
        if index == word.count {
            return node.isWord
        }
        
        let char = word[word.index(word.startIndex, offsetBy: index)]
        
        if char == "." {
            for child in node.children.values {
                if searchHelper(word, index + 1, child) {
                    return true
                }
            }
            return false
        } else {
            if let child = node.children[char] {
                return searchHelper(word, index + 1, child)
            } else {
                return false
            }
        }
    }
}
