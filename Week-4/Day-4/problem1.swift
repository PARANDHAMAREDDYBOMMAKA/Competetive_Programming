class Solution {
    func subtreeWithAllDeepest(_ root: TreeNode?) -> TreeNode? {
        func dfs(_ node: TreeNode?) -> (node: TreeNode?, depth: Int) {
            guard let node = node else { return (nil, 0) }
            let left = dfs(node.left)
            let right = dfs(node.right)
            if left.depth == right.depth {
                return (node, left.depth + 1)
            }
            return left.depth > right.depth ? left : right
        }
        return dfs(root).node
    }
}
