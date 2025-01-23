class TrieNode {
    var children = [Character: TrieNode]()
    var word: String?
}

class Solution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        var result = Set<String>()
        var root = TrieNode()
        
        for word in words {
            var node = root
            for char in word {
                if node.children[char] == nil {
                    node.children[char] = TrieNode()
                }
                node = node.children[char]!
            }
            node.word = word
        }
        
        var board = board
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                dfs(&board, i, j, root, &result)
            }
        }
        
        return Array(result)
    }
    
    func dfs(_ board: inout [[Character]], _ i: Int, _ j: Int, _ node: TrieNode, _ result: inout Set<String>) {
        if i < 0 || i >= board.count || j < 0 || j >= board[0].count {
            return
        }
        
        let char = board[i][j]
        guard let nextNode = node.children[char] else { return }
        
        if let word = nextNode.word {
            result.insert(word)
        }
        
        board[i][j] = "#"
        
        dfs(&board, i-1, j, nextNode, &result)
        dfs(&board, i+1, j, nextNode, &result)
        dfs(&board, i, j-1, nextNode, &result)
        dfs(&board, i, j+1, nextNode, &result)
        
        board[i][j] = char
    }
}
