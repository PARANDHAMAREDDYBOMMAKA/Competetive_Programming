// Your task is to calculate ab mod 1337 where a is a positive integer and b is an extremely large positive integer given in the form of an array.

// Example 1:

// Input: a = 2, b = [3]
// Output: 8
// Example 2:

// Input: a = 2, b = [1,0]
// Output: 1024
// Example 3:

// Input: a = 1, b = [4,3,3,8,5,2]
// Output: 1
 

// Constraints:

// 1 <= a <= 231 - 1
// 1 <= b.length <= 2000
// 0 <= b[i] <= 9
// b does not contain leading zeros.




// https://leetcode.com/problems/super-pow/


class Solution {
    private static final int MOD = 1337;
    public int superPow(int a, int[] b) {
        int result = 1;
        for (int i = 0; i < b.length; i++) {
            result = modPow(result, 10) * modPow(a, b[i]) % MOD;
        }
        return result;
    }
    
    private int modPow(int x, int y) {
        int result = 1;
        x = x % MOD;
        while (y > 0) {
            if ((y & 1) == 1) {
                result = (result * x) % MOD;
            }
            y >>= 1;
            x = (x * x) % MOD;
        }
        return result;
    }
}