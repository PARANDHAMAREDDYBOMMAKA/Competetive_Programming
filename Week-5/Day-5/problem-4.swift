class Solution {
    func diagonalSort(_ mat: [[Int]]) -> [[Int]] {
        var mat = mat
        var diagonals = [Int: [Int]]()
        
        for i in 0..<mat.count {
            for j in 0..<mat[0].count {
                diagonals[i - j, default: []].append(mat[i][j])
            }
        }
        
        for key in diagonals.keys {
            diagonals[key]?.sort()
        }
        
        for i in 0..<mat.count {
            for j in 0..<mat[0].count {
                let diag = i - j
                mat[i][j] = diagonals[diag]!.removeFirst()
            }
        }
        
        return mat
    }
}
