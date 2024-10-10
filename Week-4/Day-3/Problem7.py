# Given an integer array nums and an integer k, find three non-overlapping subarrays of length k with maximum sum and return them.

# Return the result as a list of indices representing the starting position of each interval (0-indexed). If there are multiple answers, return the lexicographically smallest one.

 

# Example 1:

# Input: nums = [1,2,1,2,6,7,5,1], k = 2
# Output: [0,3,5]
# Explanation: Subarrays [1, 2], [2, 6], [7, 5] correspond to the starting indices [0, 3, 5].
# We could have also taken [2, 1], but an answer of [1, 3, 5] would be lexicographically larger.
# Example 2:

# Input: nums = [1,2,1,2,1,2,1,2,1], k = 2
# Output: [0,2,4]
 

# Constraints:

# 1 <= nums.length <= 2 * 104
# 1 <= nums[i] < 216
# 1 <= k <= floor(nums.length / 3)


# https://leetcode.com/problems/maximum-sum-of-3-non-overlapping-subarrays/description/


class Solution:
    def maxSumOfThreeSubarrays(self, nums: List[int], k: int) -> List[int]:
        m, n = len(nums), 3
        dp = [[[0, -1] for _ in range(m)] for _ in range(n + 1)]
        prefix_sum = [0] * m
        curr_sum = 0

        for index, num in enumerate(nums):
            curr_sum += num
            prefix_sum[index] = curr_sum

        for i in range(1, n + 1):
            for j in range(k - 1, m):
                ai = prefix_sum[j] - prefix_sum[j - k] + dp[i - 1][j - k][0] if j - k >= 0 else prefix_sum[j]
                if ai > dp[i][j - 1][0]:
                    dp[i][j] = [ai, j - k + 1]
                else:
                    dp[i][j] = [dp[i][j-1][0], dp[i][j - 1][1]]

        third = dp[n][m-1][1]
        second = dp[n-1][third-1][1]
        first = dp[n-2][second-1][1]
        return [first, second, third]
