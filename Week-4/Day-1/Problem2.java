
// Given an integer array nums, return the maximum result of nums[i] XOR nums[j], where 0 <= i <= j < n.

// Example 1:

// Input: nums = [3,10,5,25,2,8]
// Output: 28
// Explanation: The maximum result is 5 XOR 25 = 28.
// Example 2:

// Input: nums = [14,70,53,83,49,91,36,80,92,51,66,70]
// Output: 127
 

// Constraints:

// 1 <= nums.length <= 2 * 105
// 0 <= nums[i] <= 231 - 1



// https://leetcode.com/problems/maximum-xor-of-two-numbers-in-an-array/


class Solution {
    public int findMaximumXOR(int[] nums) {
        TrieNode root = new TrieNode();
        int maxXor = 0;

        for (int num : nums) {
            TrieNode node = root;
            TrieNode xorNode = root;
            int currentXor = 0;

            for (int i = 31; i >= 0; i--) {
                int bit = (num >> i) & 1;

                if (node.children[bit] == null) {
                    node.children[bit] = new TrieNode();
                }
                node = node.children[bit];

                int oppositeBit = 1 - bit;
                if (xorNode.children[oppositeBit] != null) {
                    currentXor |= (1 << i);
                    xorNode = xorNode.children[oppositeBit];
                } else {
                    xorNode = xorNode.children[bit];
                }
            }
            maxXor = Math.max(maxXor, currentXor);
        }

        return maxXor;
    }

    static class TrieNode {
        TrieNode[] children = new TrieNode[2];
    }
}