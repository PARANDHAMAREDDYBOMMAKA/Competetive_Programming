class Solution {
    func trap(_ height: [Int]) -> Int {
        var leftMax = [Int](repeating: 0, count: height.count)
        var rightMax = [Int](repeating: 0, count: height.count)
        var water = 0
        
        leftMax[0] = height[0]
        for i in 1..<height.count {
            leftMax[i] = max(leftMax[i - 1], height[i])
        }
        
        rightMax[height.count - 1] = height[height.count - 1]
        for i in stride(from: height.count - 2, through: 0, by: -1) {
            rightMax[i] = max(rightMax[i + 1], height[i])
        }
        
        for i in 0..<height.count {
            water += max(0, min(leftMax[i], rightMax[i]) - height[i])
        }
        
        return water
    }
}
