// Given an integer array nums, handle multiple queries of the following types:

// Update the value of an element in nums.
// Calculate the sum of the elements of nums between indices left and right inclusive where left <= right.
// Implement the NumArray class:

// NumArray(int[] nums) Initializes the object with the integer array nums.
// void update(int index, int val) Updates the value of nums[index] to be val.
// int sumRange(int left, int right) Returns the sum of the elements of nums between indices left and right inclusive (i.e. nums[left] + nums[left + 1] + ... + nums[right]).
 

// Example 1:

// Input
// ["NumArray", "sumRange", "update", "sumRange"]
// [[[1, 3, 5]], [0, 2], [1, 2], [0, 2]]
// Output
// [null, 9, null, 8]

// Explanation
// NumArray numArray = new NumArray([1, 3, 5]);
// numArray.sumRange(0, 2); // return 1 + 3 + 5 = 9
// numArray.update(1, 2);   // nums = [1, 2, 5]
// numArray.sumRange(0, 2); // return 1 + 2 + 5 = 8
 

// Constraints:

// 1 <= nums.length <= 3 * 104
// -100 <= nums[i] <= 100
// 0 <= index < nums.length
// -100 <= val <= 100
// 0 <= left <= right < nums.length
// At most 3 * 104 calls will be made to update and sumRange.

// https://leetcode.com/problems/range-sum-query-mutable/

// Solution:

class NumArray {
    private int[] segmentTree;
    private int n;

    public NumArray(int[] nums) {
       if (nums.length > 0) {
            n = nums.length;
            segmentTree = new int[2 * n];
            for (int i = 0; i < n; i++) {
                segmentTree[n + i] = nums[i];
            }
            for (int i = n - 1; i > 0; i--) {
                segmentTree[i] = segmentTree[2 * i] + segmentTree[2 * i + 1];
            }
        } 
    }
    
    public void update(int index, int val) {
        int pos = n + index;
        segmentTree[pos] = val;

        while (pos > 0) {
            int left = pos;
            int right = pos;
            if (pos % 2 == 0) {
                right = pos + 1;
            } else {
                left = pos - 1;
            }
            pos /= 2;
            segmentTree[pos] = segmentTree[left] + segmentTree[right];
        }
    }
    
    public int sumRange(int left, int right) {
        int sum = 0;
        int l = n + left;
        int r = n + right + 1;

        while (l < r) {
            if (l % 2 == 1) {
                sum += segmentTree[l];
                l++;
            }
            if (r % 2 == 1) {
                r--;
                sum += segmentTree[r];
            }
            l /= 2;
            r /= 2;
        }
        return sum;
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * NumArray obj = new NumArray(nums);
 * obj.update(index,val);
 * int param_2 = obj.sumRange(left,right);
 */