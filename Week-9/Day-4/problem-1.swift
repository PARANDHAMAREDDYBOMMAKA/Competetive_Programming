class Solution {
    func minimumEffortPath(_ heights: [[Int]]) -> Int {
        let m = heights.count
        let n = heights[0].count
        var left = 0
        var right = 1000000
        
        func canReach(_ maxEffort: Int) -> Bool {
            var visited = Array(repeating: Array(repeating: false, count: n), count: m)
            var queue = [(0, 0)]
            visited[0][0] = true
            
            while !queue.isEmpty {
                let (i, j) = queue.removeFirst()
                if i == m - 1 && j == n - 1 {
                    return true
                }
                for (di, dj) in [(-1, 0), (1, 0), (0, -1), (0, 1)] {
                    let ni = i + di, nj = j + dj
                    if ni >= 0 && ni < m && nj >= 0 && nj < n && !visited[ni][nj] {
                        let diff = abs(heights[i][j] - heights[ni][nj])
                        if diff <= maxEffort {
                            queue.append((ni, nj))
                            visited[ni][nj] = true
                        }
                    }
                }
            }
            return false
        }
        
        while left < right {
            let mid = left + (right - left) / 2
            if canReach(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        return left
    }
}
