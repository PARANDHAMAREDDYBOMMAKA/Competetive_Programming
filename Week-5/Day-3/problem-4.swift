class Solution {
    func removeNodes(_ head: ListNode?) -> ListNode? {
        var nodes = [ListNode]()
        var curr = head
        while let node = curr {
            nodes.append(node)
            curr = node.next
        }
        
        for i in (0..<nodes.count - 1).reversed() {
            if nodes[i].val < nodes[i + 1].val {
                nodes[i] = nodes[i + 1]
            }
        }
        
        return nodes.first
    }
}
