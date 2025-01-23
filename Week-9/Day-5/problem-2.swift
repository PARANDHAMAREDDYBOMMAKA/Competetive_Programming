class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        guard !points.isEmpty else { return 0 }
        
        let sortedPoints = points.sorted { $0[1] < $1[1] }
        var arrows = 1
        var end = sortedPoints[0][1]
        
        for i in 1..<sortedPoints.count {
            if sortedPoints[i][0] > end {
                arrows += 1
                end = sortedPoints[i][1]
            }
        }
        
        return arrows
    }
}
