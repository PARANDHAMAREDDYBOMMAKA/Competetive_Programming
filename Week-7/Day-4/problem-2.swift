class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let rows = board.count
        let cols = board[0].count
        
        func backtrack(_ r: Int, _ c: Int, _ i: Int) -> Bool {
            if i == word.count { return true }
            if r < 0 || c < 0 || r >= rows || c >= cols || board[r][c] != word[word.index(word.startIndex, offsetBy: i)] {
                return false
            }
            
            var board = board
            var temp = board[r][c]
            board[r][c] = "#"
            
            let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
            for (dr, dc) in directions {
                if backtrack(r + dr, c + dc, i + 1) {
                    return true
                }
            }
            
            board[r][c] = temp
            return false
        }
        
        for r in 0..<rows {
            for c in 0..<cols {
                if backtrack(r, c, 0) {
                    return true
                }
            }
        }
        
        return false
    }
}
