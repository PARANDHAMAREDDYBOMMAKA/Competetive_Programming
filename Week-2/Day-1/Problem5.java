// You are given a string s representing an attendance record for a student where each character signifies whether the student was absent, late, or present on that day. The record only contains the following three characters:

// 'A': Absent.
// 'L': Late.
// 'P': Present.
// The student is eligible for an attendance award if they meet both of the following criteria:

// The student was absent ('A') for strictly fewer than 2 days total.
// The student was never late ('L') for 3 or more consecutive days.
// Return true if the student is eligible for an attendance award, or false otherwise.

 

// Example 1:

// Input: s = "PPALLP"
// Output: true
// Explanation: The student has fewer than 2 absences and was never late 3 or more consecutive days.
// Example 2:

// Input: s = "PPALLL"
// Output: false
// Explanation: The student was late 3 consecutive days in the last 3 days, so is not eligible for the award.
 

// Constraints:

// 1 <= s.length <= 1000
// s[i] is either 'A', 'L', or 'P'.


// https://leetcode.com/problems/student-attendance-record-i/

// Solution:

class Solution {
    public boolean checkRecord(String s) {
        return check(s, 0, 0, 0);
    }
    
    private boolean check(String s, int indx, int a, int l) {
        if (indx == s.length()) {
            return a <= 1 && l <= 2;
        }
        
        char c = s.charAt(indx);
        if (c == 'A') {
            a++;
            if (a > 1) {
                return false;
            }
            l = 0;
        } else if (c == 'L') {
            l++;
            if (l > 2) {
                return false;
            }
        } else {
            l = 0;
        }
        
        return check(s, indx + 1, a, l);
    }
}
