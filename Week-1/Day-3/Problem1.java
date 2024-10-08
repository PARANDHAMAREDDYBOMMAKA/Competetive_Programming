// Given two strings s and t, determine if they are isomorphic.

// Two strings s and t are isomorphic if the characters in s can be replaced to get t.

// All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character, but a character may map to itself.

// Example 1:

// Input: s = "egg", t = "add"
// Output: true
// Example 2:

// Input: s = "foo", t = "bar"
// Output: false
// Example 3:
// Input: s = "paper", t = "title"
// Output: true
// Constraints:

// 1 <= s.length <= 5 * 104
// t.length == s.length
// s and t consist of any valid ascii character.

// https://leetcode.com/problems/isomorphic-strings/description/

// Solution
import java.util.*;

class Solution {
    public boolean isIsomorphic(String s, String t) {
        if (s.length() !=t.length()){
            return false;
        }
        HashMap<Character, Character> mapT = new HashMap<>();
        HashMap<Character, Character> mapS = new HashMap<>();
        for (int i = 0; i < s.length(); i++) {
            char charS = s.charAt(i);
            char charT = t.charAt(i);
            
            if (mapT.containsKey(charS)) {
                if (mapT.get(charS) != charT) {
                    return false;
                }
            } else {
                mapT.put(charS, charT);
            }
            
            if (mapS.containsKey(charT)) {
                if (mapS.get(charT) != charS) {
                    return false;
                }
            } else {
                mapS.put(charT, charS);
            }
        }
        
        return true;
    }
}