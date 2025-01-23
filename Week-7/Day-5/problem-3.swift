class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        let directions = [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)]
        let n = grid.count
        
        if grid[0][0] == 1 || grid[n - 1][n - 1] == 1 {
            return -1
        }
        
        var queue = [(0, 0, 1)] // (row, col, distance)
        var visited = Set([(0, 0)])
        
        while !queue.isEmpty {
            let (x, y, dist) = queue.removeFirst()
            if x == n - 1 && y == n - 1 {
                return dist
            }
            
            for (dx, dy) in directions {
                let nx = x + dx
                let ny = y + dy
                if nx >= 0 && ny >= 0 && nx < n && ny < n && grid[nx][ny] == 0 && !visited.contains((nx, ny)) {
                    queue.append((nx, ny, dist + 1))
                    visited.insert((nx, ny))
                }
            }
        }
        
        return -1
    }
}
