class Solution {
    func maxDepth(_ root: Node?) -> Int {
        guard let root = root else { return 0 }
        var maxDepth = 0
        for child in root.children {
            maxDepth = max(maxDepth, maxDepth(child))
        }
        return maxDepth + 1
    }
}
