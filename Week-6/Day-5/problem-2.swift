class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let node = root else { return nil }
        let left = node.left
        node.left = invertTree(node.right)
        node.right = invertTree(left)
        return node
    }
}
