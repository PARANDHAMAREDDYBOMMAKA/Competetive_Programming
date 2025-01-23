class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var firstRowZero = false
        var firstColZero = false
        
        for i in 0..<matrix.count {
            if matrix[i][0] == 0 {
                firstColZero = true
            }
        }
        
        for i in 0..<matrix[0].count {
            if matrix[0][i] == 0 {
                firstRowZero = true
            }
        }
        
        for i in 1..<matrix.count {
            for j in 1..<matrix[0].count {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
            }
        }
        
        for i in 1..<matrix.count {
            for j in 1..<matrix[0].count {
                if matrix[i][0] == 0 || matrix[0][j] == 0 {
                    matrix[i][j] = 0
                }
            }
        }
        
        if firstRowZero {
            for i in 0..<matrix[0].count {
                matrix[0][i] = 0
            }
        }
        
        if firstColZero {
            for i in 0..<matrix.count {
                matrix[i][0] = 0
            }
        }
    }
}
