class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || head?.next == nil || k == 0 {
            return head
        }
        
        var length = 1
        var node = head
        while node?.next != nil {
            node = node?.next
            length += 1
        }
        
        var k = k % length
        if k == 0 { return head }
        
        var slow = head
        var fast = head
        for _ in 0..<k {
            fast = fast?.next
        }
        
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next
        }
        
        fast?.next = head
        let newHead = slow?.next
        slow?.next = nil
        
        return newHead
    }
}
