// Given a string s, sort it in decreasing order based on the frequency of the characters. The frequency of a character is the number of times it appears in the string.

// Return the sorted string. If there are multiple answers, return any of them.

 

// Example 1:

// Input: s = "tree"
// Output: "eert"
// Explanation: 'e' appears twice while 'r' and 't' both appear once.
// So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.
// Example 2:

// Input: s = "cccaaa"
// Output: "aaaccc"
// Explanation: Both 'c' and 'a' appear three times, so both "cccaaa" and "aaaccc" are valid answers.
// Note that "cacaca" is incorrect, as the same characters must be together.
// Example 3:

// Input: s = "Aabb"
// Output: "bbAa"
// Explanation: "bbaA" is also a valid answer, but "Aabb" is incorrect.
// Note that 'A' and 'a' are treated as two different characters.
 

// Constraints:

// 1 <= s.length <= 5 * 105
// s consists of uppercase and lowercase English letters and digits.

// https://leetcode.com/problems/sort-characters-by-frequency/description/

// Solution:
import java.util.*;


class Solution {
    public String frequencySort(String s) {
        int[] freq = new int[256];
        for(char c :s.toCharArray()){
            freq[c]++;
        }
        List<Character> chars = new ArrayList<>();
        for(char c = 0;c<256;c++){
            if(freq[c] > 0){
                chars.add(c);
            }
        }
         chars.sort((a, b) -> Integer.compare(freq[b], freq[a]));
         StringBuilder str = new StringBuilder();
         for(char c:chars){
            for(int i=0;i<freq[c];i++){
                str.append(c);
            }
         }
         return str.toString();
    }
}