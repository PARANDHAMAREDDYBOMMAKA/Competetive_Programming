// An array is monotonic if it is either monotone increasing or monotone decreasing.

// An array nums is monotone increasing if for all i <= j, nums[i] <= nums[j]. An array nums is monotone decreasing if for all i <= j, nums[i] >= nums[j].

// Given an integer array nums, return true if the given array is monotonic, or false otherwise.

 

// Example 1:

// Input: nums = [1,2,2,3]
// Output: true
// Example 2:

// Input: nums = [6,5,4,4]
// Output: true
// Example 3:

// Input: nums = [1,3,2]
// Output: false
 

// Constraints:

// 1 <= nums.length <= 105
// -105 <= nums[i] <= 105

// https://leetcode.com/problems/monotonic-array/description/

// Solution:

class Solution {
    public boolean isMonotonic(int[] nums) {
        boolean isIncreasing = true;
        boolean isDecreasing = true;
        for (int i = 1; i < nums.length; i++) {
            if (nums[i] > nums[i - 1]) {
                isDecreasing = false;
            }
            if (nums[i] < nums[i - 1]) {
                isIncreasing = false;
            }
        }

        return isIncreasing || isDecreasing;
    }
}

// Solution explanation:

// 1. Initialize two boolean variables, isIncreasing and isDecreasing, both set to true. These variables will be used to keep track of whether the array is monotone increasing or decreasing.
// 2. Iterate through the array starting from the second element (index 1).
// 3. Compare the current element with the previous element using the '>' and '<' operators.
// 4. If the current element is greater than the previous element, set isDecreasing to false. This means the array is not monotone decreasing.
// 5. If the current element is less than the previous element, set isIncreasing to false. This means the array is not monotone increasing.
// 6. After iterating through all the elements, check if either isDecreasing or isIncreasing is true.
// 7. If either isDecreasing or isIncreasing is true, return false. This means the array is not monotonic.
// 8. If both isDecreasing and isIncreasing are false, return true. This means the array is monotonic.

// This solution has a time complexity of O(n), where n is the length of the input array. It does not use any additional data structures, and it only iterates through the array once.

// Note: This solution assumes that the input array will always have at least two elements. If the array has only one element, it is always considered monotonic.

