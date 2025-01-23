class Solution {
    func checkOverlap(_ circle: [Int], _ rectangle: [Int]) -> Bool {
        let cx = circle[0], cy = circle[1], r = circle[2]
        let left = rectangle[0], bottom = rectangle[1], right = rectangle[2], top = rectangle[3]
        
        let closestX = max(left, min(cx, right))
        let closestY = max(bottom, min(cy, top))
        
        return (closestX - cx) * (closestX - cx) + (closestY - cy) * (closestY - cy) <= r * r
    }
}
