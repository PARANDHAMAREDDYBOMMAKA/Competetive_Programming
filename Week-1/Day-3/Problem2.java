// You are given three strings: s1, s2, and s3. In one operation you can choose one of these strings and delete its rightmost character. Note that you cannot completely empty a string.

// Return the minimum number of operations required to make the strings equal. If it is impossible to make them equal, return -1.

 

// Example 1:

// Input: s1 = "abc", s2 = "abb", s3 = "ab"

// Output: 2

// Explanation: Deleting the rightmost character from both s1 and s2 will result in three equal strings.

// Example 2:

// Input: s1 = "dac", s2 = "bac", s3 = "cac"

// Output: -1

// Explanation: Since the first letters of s1 and s2 differ, they cannot be made equal.

 

// Constraints:

// 1 <= s1.length, s2.length, s3.length <= 100
// s1, s2 and s3 consist only of lowercase English letters.

// https://leetcode.com/problems/make-three-strings-equal/description/

// Solution:

class Solution {
    public int findMinimumOperations(String s1, String s2, String s3) {
        int minLength = Math.min(s1.length(), Math.min(s2.length(), s3.length()));
        int commonPrefixLength = 0;
        
        for (int i = 0; i < minLength; i++) {
            if (s1.charAt(i) == s2.charAt(i) && s1.charAt(i) == s3.charAt(i)) {
                commonPrefixLength++;
            } else {
                break;
            }
        }
        
        if (commonPrefixLength == 0) {
            return -1;
        }
        
        int operations = (s1.length() - commonPrefixLength) + 
                         (s2.length() - commonPrefixLength) + 
                         (s3.length() - commonPrefixLength);
        
        return operations;
    }
}