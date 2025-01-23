class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var heap = [(Int, ListNode)]()
        for list in lists {
            var node = list
            while let n = node {
                heap.append((n.val, n))
                node = n.next
            }
        }
        
        heap.sort { $0.0 < $1.0 }
        
        let dummy = ListNode(0)
        var curr = dummy
        
        for (_, node) in heap {
            curr.next = node
            curr = curr.next!
        }
        
        return dummy.next
    }
}
