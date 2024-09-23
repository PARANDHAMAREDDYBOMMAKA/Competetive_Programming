# Given a string s, partition s such that every 
# substring
#  of the partition is a 
# palindrome
# .

# Return the minimum cuts needed for a palindrome partitioning of s.

# Example 1:

# Input: s = "aab"
# Output: 1
# Explanation: The palindrome partitioning ["aa","b"] could be produced using 1 cut.
# Example 2:

# Input: s = "a"
# Output: 0
# Example 3:

# Input: s = "ab"
# Output: 1

# Constraints:

# 1 <= s.length <= 2000
# s consists of lowercase English letters only.


# https://leetcode.com/problems/palindrome-partitioning-ii/


class Solution:
    def minCut(self, s: str) -> int:
        n = len(s)
        dp = [0] * n
        isPalindrome = [[False] * n for _ in range(n)]

        for end in range(n):
            minCuts = end
            for start in range(end + 1):
                if s[start] == s[end] and (end - start <= 2 or isPalindrome[start + 1][end - 1]):
                    isPalindrome[start][end] = True
                    minCuts = 0 if start == 0 else min(minCuts, dp[start - 1] + 1)
            dp[end] = minCuts

        return dp[n - 1]