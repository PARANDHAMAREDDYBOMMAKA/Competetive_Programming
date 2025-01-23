class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var left = 0
        var right = matrix.count * matrix[0].count - 1
        
        while left <= right {
            let mid = left + (right - left) / 2
            let midVal = matrix[mid / matrix[0].count][mid % matrix[0].count]
            
            if midVal == target {
                return true
            } else if midVal < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return false
    }
}
