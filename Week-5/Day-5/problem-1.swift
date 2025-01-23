class Solution {
    func rob(_ root: TreeNode?) -> Int {
        func dfs(_ node: TreeNode?) -> (Int, Int) {
            guard let node = node else { return (0, 0) }
            let left = dfs(node.left)
            let right = dfs(node.right)
            return (max(left.0, left.1) + max(right.0, right.1), left.0 + right.0 + node.val)
        }
        let result = dfs(root)
        return max(result.0, result.1)
    }
}
