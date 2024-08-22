// You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.

// Merge all the linked-lists into one sorted linked-list and return it.

 

// Example 1:

// Input: lists = [[1,4,5],[1,3,4],[2,6]]
// Output: [1,1,2,3,4,4,5,6]
// Explanation: The linked-lists are:
// [
//   1->4->5,
//   1->3->4,
//   2->6
// ]
// merging them into one sorted list:
// 1->1->2->3->4->4->5->6
// Example 2:

// Input: lists = []
// Output: []
// Example 3:

// Input: lists = [[]]
// Output: []
 

// Constraints:

// k == lists.length
// 0 <= k <= 104
// 0 <= lists[i].length <= 500
// -104 <= lists[i][j] <= 104
// lists[i] is sorted in ascending order.
// The sum of lists[i].length will not exceed 104.

// https://leetcode.com/problems/merge-k-sorted-lists/description/

// Solution:

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode mergeKLists(ListNode[] lists) {
        if(lists == null || lists.length ==0){
            return null;
        }

        int gap = 1;
        while (gap < lists.length) {
            for (int i = 0; i + gap < lists.length; i += gap * 2) {
                ListNode l1 = lists[i];
                ListNode l2 = lists[i + gap];
                
                ListNode dum = new ListNode(0);
                ListNode curr = dum;

                while (l1 != null && l2 != null) {
                    if (l1.val <= l2.val) {
                        curr.next = l1;
                        l1 = l1.next;
                    } else {
                        curr.next = l2;
                        l2 = l2.next;
                    }
                    curr = curr.next;
                }

                if (l1 != null) {
                    curr.next = l1;
                } else {
                    curr.next = l2;
                }

                lists[i] = dum.next;
            }
            gap *= 2;
        }
        
        return lists[0];
    }
}