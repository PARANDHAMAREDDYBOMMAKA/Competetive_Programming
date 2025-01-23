class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        var stack: [Character] = []
        var remaining = k
        for digit in num {
            while !stack.isEmpty && remaining > 0 && stack.last! > digit {
                stack.removeLast()
                remaining -= 1
            }
            stack.append(digit)
        }
        while remaining > 0 {
            stack.removeLast()
            remaining -= 1
        }
        
        let result = stack.drop { $0 == "0" }
        return result.isEmpty ? "0" : String(result)
    }
}
