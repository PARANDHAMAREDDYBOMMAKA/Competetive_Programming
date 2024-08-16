// Strings s1 and s2 are k-similar (for some non-negative integer k) if we can swap the positions of two letters in s1 exactly k times so that the resulting string equals s2.

// Given two anagrams s1 and s2, return the smallest k for which s1 and s2 are k-similar.

 

// Example 1:

// Input: s1 = "ab", s2 = "ba"
// Output: 1
// Explanation: The two string are 1-similar because we can use one swap to change s1 to s2: "ab" --> "ba".
// Example 2:

// Input: s1 = "abc", s2 = "bca"
// Output: 2
// Explanation: The two strings are 2-similar because we can use two swaps to change s1 to s2: "abc" --> "bac" --> "bca".
 

// Constraints:

// 1 <= s1.length <= 20
// s2.length == s1.length
// s1 and s2 contain only lowercase letters from the set {'a', 'b', 'c', 'd', 'e', 'f'}.
// s2 is an anagram of s1.

// https://leetcode.com/problems/k-similar-strings/description/

// Solution:
import java.util.*;

class Solution {
    public int kSimilarity(String s1, String s2) {
        if(s1.equals(s2)){
            return 0;
        }
        Queue<String> queue = new LinkedList<>();
        Set<String> visited = new HashSet<>();
        queue.offer(s1);
        visited.add(s1);
        int noOfSw = 0;
        while (!queue.isEmpty()) {
            int len = queue.size();
            noOfSw++;
            for (int i = 0; i < len; i++) {
                String curr = queue.poll();
                int j = 0;

                while (j < curr.length() && curr.charAt(j) == s2.charAt(j)) {
                    j++;
                }

                for (int k = j + 1; k < curr.length(); k++) {
                    if (curr.charAt(k) == s2.charAt(j) && curr.charAt(k) != s2.charAt(k)) {
                        char[] charArray = curr.toCharArray();
                        char temp = charArray[j];
                        charArray[j] = charArray[k];
                        charArray[k] = temp;
                        String next = new String(charArray);

                        if (next.equals(s2)) return noOfSw;
                        if (!visited.contains(next)) {
                            visited.add(next);
                            queue.offer(next);
                        }
                    }
                }
            }
        }

        return noOfSw;
    }
}