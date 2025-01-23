class Solution {
    func checkOverlap(_ rec: [Int], _ cir: [Int]) -> Bool {
        let (cx, cy, r) = (cir[0], cir[1], cir[2])
        let (x1, y1, x2, y2) = (rec[0], rec[1], rec[2], rec[3])
        let closestX = max(x1, min(cx, x2))
        let closestY = max(y1, min(cy, y2))
        return (closestX - cx) * (closestX - cx) + (closestY - cy) * (closestY - cy) <= r * r
    }
}
