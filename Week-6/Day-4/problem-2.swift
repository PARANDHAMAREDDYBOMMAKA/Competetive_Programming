class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        for i in 0..<n / 2 {
            for j in i..<n - i - 1 {
                let temp = matrix[i][j]
                matrix[i][j] = matrix[n - j - 1][i]
                matrix[n - j - 1][i] = matrix[n - i - 1][n - j - 1]
                matrix[n - i - 1][n - j - 1] = matrix[j][n - i - 1]
                matrix[j][n - i - 1] = temp
            }
        }
    }
}
