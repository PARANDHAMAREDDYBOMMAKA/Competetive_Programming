class Solution {
    func decodeString(_ s: String) -> String {
        var stack: [String] = []
        var num = 0
        var currentString = ""
        
        for char in s {
            if char.isDigit() {
                num = num * 10 + Int(String(char))!
            } else if char == "[" {
                stack.append(currentString)
                stack.append(String(num))
                currentString = ""
                num = 0
            } else if char == "]" {
                var temp = currentString
                currentString = stack.removeLast()
                let repeatCount = Int(stack.removeLast())!
                currentString += String(repeating: temp, count: repeatCount)
            } else {
                currentString.append(char)
            }
        }
        return currentString
    }
}
