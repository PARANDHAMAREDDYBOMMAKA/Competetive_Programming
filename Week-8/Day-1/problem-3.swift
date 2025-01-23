class Solution {
    func replaceWords(_ dict: [String], _ sentence: String) -> String {
        let trie = Trie()
        for word in dict {
            trie.insert(word)
        }
        let words = sentence.split(separator: " ")
        var result = [String]()
        
        for word in words {
            var replacement = trie.search(String(word))
            result.append(replacement)
        }
        return result.joined(separator: " ")
    }
}

class Trie {
    var children: [Character: Trie] = [:]
    
    func insert(_ word: String) {
        var current = self
        for char in word {
            if current.children[char] == nil {
                current.children[char] = Trie()
            }
            current = current.children[char]!
        }
    }
    
    func search(_ word: String) -> String {
        var current = self
        var prefix = ""
        for char in word {
            if let next = current.children[char] {
                prefix.append(char)
                current = next
            } else {
                return word
            }
        }
        return prefix
    }
}
