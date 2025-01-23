class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var stack1 = [Int]()
        var stack2 = [Int]()
        
        var p1 = l1, p2 = l2
        while p1 != nil {
            stack1.append(p1!.val)
            p1 = p1?.next
        }
        while p2 != nil {
            stack2.append(p2!.val)
            p2 = p2?.next
        }
        
        var carry = 0
        var result: ListNode?
        
        while !stack1.isEmpty || !stack2.isEmpty || carry != 0 {
            let sum = (stack1.isEmpty ? 0 : stack1.removeLast()) + (stack2.isEmpty ? 0 : stack2.removeLast()) + carry
            carry = sum / 10
            let node = ListNode(sum % 10)
            node.next = result
            result = node
        }
        
        return result
    }
}
