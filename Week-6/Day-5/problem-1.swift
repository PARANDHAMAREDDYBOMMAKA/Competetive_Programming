class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBST(root, nil, nil)
    }
    
    private func isValidBST(_ root: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        guard let node = root else { return true }
        
        if let min = min, node.val <= min { return false }
        if let max = max, node.val >= max { return false }
        
        return isValidBST(node.left, min, node.val) && isValidBST(node.right, node.val, max)
    }
}
