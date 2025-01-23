class Solution {
    class TrieNode {
        var children: [Character: TrieNode] = [:]
        var word: String?
    }
    
    func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
        let root = TrieNode()
        
        // Build the Trie
        for word in dictionary {
            var node = root
            for char in word {
                if node.children[char] == nil {
                    node.children[char] = TrieNode()
                }
                node = node.children[char]!
            }
            node.word = word
        }
        
        // Replace words in sentence
        let words = sentence.split(separator: " ")
        var result = [String]()
        
        for word in words {
            var node = root
            var replaced = false
            for char in word {
                if let nextNode = node.children[char] {
                    node = nextNode
                    if let w = node.word {
                        result.append(w)
                        replaced = true
                        break
                    }
                } else {
                    break
                }
            }
            if !replaced {
                result.append(String(word))
            }
        }
        
        return result.joined(separator: " ")
    }
}
