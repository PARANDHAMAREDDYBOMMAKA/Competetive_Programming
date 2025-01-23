class Solution {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var result = Int.min
        _ = helper(root, &result)
        return result
    }
    
    func helper(_ node: TreeNode?, _ result: inout Int) -> Int {
        guard let node = node else { return 0 }
        
        let left = max(helper(node.left, &result), 0)
        let right = max(helper(node.right, &result), 0)
        
        result = max(result, left + right + node.val)
        
        return max(left, right) + node.val
    }
}
