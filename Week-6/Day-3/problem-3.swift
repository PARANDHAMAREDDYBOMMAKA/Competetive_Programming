class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack = [Int]()
        var maxArea = 0
        let heights = heights + [0]
        
        for i in 0..<heights.count {
            while !stack.isEmpty && heights[stack.last!] > heights[i] {
                let h = heights[stack.removeLast()]
                let w = stack.isEmpty ? i : i - stack.last! - 1
                maxArea = max(maxArea, h * w)
            }
            stack.append(i)
        }
        
        return maxArea
    }
}
