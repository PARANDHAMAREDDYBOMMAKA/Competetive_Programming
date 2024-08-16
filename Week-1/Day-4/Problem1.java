// Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.

// Note: You must not use any built-in BigInteger library or convert the inputs to integer directly.

// Example 1:

// Input: num1 = "2", num2 = "3"
// Output: "6"
// Example 2:

// Input: num1 = "123", num2 = "456"
// Output: "56088"

// Constraints:

// 1 <= num1.length, num2.length <= 200
// num1 and num2 consist of digits only.
// Both num1 and num2 do not contain any leading zero, except the number 0 itself.

// https://leetcode.com/problems/multiply-strings/description/

// Solution:

class Solution {
    public String multiply(String num1, String num2) {
        int m = num1.length();
        int n = num2.length();
        if (num1.equals("0") || num2.equals("0")) {
            return "0";
        }
        int[] res = new int[m + n];
        int pos1 = 0;
        int pos2 = 0;
        for (int i = m - 1; i >= 0; i--) {
            int n1 = num1.charAt(i) - '0';
            pos2 = 0;
            for (int j = n - 1; j >= 0; j--) {
                int n2 = num2.charAt(j) - '0';
                int sum = n1 * n2 + res[pos1 + pos2];
                res[pos1 + pos2] = sum % 10;
                res[pos1 + pos2 + 1] += sum / 10;

                pos2++;
            }
            pos1++;
        }
        StringBuilder sb = new StringBuilder();
        for (int i = res.length - 1; i >= 0; i--) {
            if (!(sb.length() == 0 && res[i] == 0)) {
                sb.append(res[i]);
            }
        }

        return sb.toString();
    }
}