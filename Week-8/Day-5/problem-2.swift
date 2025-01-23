class Solution {
    func breakPalindrome(_ palindrome: String) -> String {
        if palindrome.count == 1 { return "" }
        
        let s = Array(palindrome)
        var i = 0
        while i < s.count / 2 {
            if s[i] != "a" {
                var result = s
                result[i] = "a"
                return String(result)
            }
            i += 1
        }
        
        var result = s
        result[s.count - 1] = "b"
        return String(result)
    }
}
