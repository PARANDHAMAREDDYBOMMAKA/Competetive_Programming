class MagicDictionary {
    var words: [String] = []
    
    /** Initialize your data structure here. */
    init() {}
    
    /** Build a dictionary through a list of words */
    func buildDict(_ dict: [String]) {
        words = dict
    }
    
    /** Returns if there is any word in the trie that equals to the given word after modifying exactly one character */
    func search(_ word: String) -> Bool {
        for dictWord in words {
            if dictWord.count == word.count {
                var diffCount = 0
                for i in 0..<word.count {
                    if word[word.index(word.startIndex, offsetBy: i)] != dictWord[dictWord.index(dictWord.startIndex, offsetBy: i)] {
                        diffCount += 1
                    }
                    if diffCount > 1 { break }
                }
                if diffCount == 1 { return true }
            }
        }
        return false
    }
}
