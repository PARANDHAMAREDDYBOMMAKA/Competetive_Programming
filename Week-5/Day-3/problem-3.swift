class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var lists = lists
        while lists.count > 1 {
            var mergedLists = [ListNode?]()
            for i in stride(from: 0, to: lists.count, by: 2) {
                let list1 = lists[i]
                let list2 = i + 1 < lists.count ? lists[i + 1] : nil
                mergedLists.append(mergeTwoLists(list1, list2))
            }
            lists = mergedLists
        }
        return lists.first ?? nil
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var dummy = ListNode(0)
        var current = dummy
        var l1 = l1
        var l2 = l2
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                current.next = l1
                l1 = l1?.next
            } else {
                current.next = l2
                l2 = l2?.next
            }
            current = current.next!
        }
        current.next = l1 ?? l2
        return dummy.next
    }
}
