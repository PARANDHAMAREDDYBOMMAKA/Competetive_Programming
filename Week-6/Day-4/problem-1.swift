class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result = [Int]()
        var top = 0, bottom = matrix.count - 1, left = 0, right = matrix[0].count - 1
        
        while top <= bottom && left <= right {
            for i in left...right {
                result.append(matrix[top][i])
            }
            top += 1
            
            for i in top...bottom {
                result.append(matrix[i][right])
            }
            right -= 1
            
            if top <= bottom {
                for i in stride(from: right, through: left, by: -1) {
                    result.append(matrix[bottom][i])
                }
                bottom -= 1
            }
            
            if left <= right {
                for i in stride(from: bottom, through: top, by: -1) {
                    result.append(matrix[i][left])
                }
                left += 1
            }
        }
        
        return result
    }
}
