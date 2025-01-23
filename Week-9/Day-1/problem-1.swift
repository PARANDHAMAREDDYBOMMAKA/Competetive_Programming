class Solution {
    func isReflected(_ points: [[Int]]) -> Bool {
        var xSet = Set<Int>()
        var ySet = Set<Int>()
        for point in points {
            xSet.insert(point[0])
            ySet.insert(point[1])
        }
        
        var mirror = Set<[Int]>()
        for point in points {
            let x = point[0]
            let y = point[1]
            if mirror.contains([x, y]) {
                mirror.remove([x, y])
            } else {
                mirror.insert([x, -y])
            }
        }
        
        return mirror.isEmpty
    }
}
