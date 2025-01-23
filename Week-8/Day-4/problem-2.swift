class Solution {
    var diameter = 0
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        _ = depth(root)
        return diameter
    }
    
    func depth(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        
        let left = depth(node.left)
        let right = depth(node.right)
        
        diameter = max(diameter, left + right)
        
        return max(left, right) + 1
    }
}
