class Solution {
    func longestZigZag(_ root: TreeNode?) -> Int {
        var maxLength = 0
        
        func dfs(_ node: TreeNode?, _ direction: Int, _ length: Int) {
            guard let node = node else { return }
            maxLength = max(maxLength, length)
            if direction == 0 {
                dfs(node.left, 1, length + 1)
                dfs(node.right, 0, 1)
            } else {
                dfs(node.right, 0, length + 1)
                dfs(node.left, 1, 1)
            }
        }
        
        dfs(root, 0, 0)
        return maxLength
    }
}
