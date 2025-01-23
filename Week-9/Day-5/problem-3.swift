class Solution {
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        if s.count < k {
            return false
        }
        
        var seen = Set<String>()
        let length = s.count - k + 1
        
        for i in 0..<length {
            let sub = String(s[s.index(s.startIndex, offsetBy: i)..<s.index(s.startIndex, offsetBy: i+k)])
            seen.insert(sub)
        }
        
        return seen.count == (1 << k)
    }
}
