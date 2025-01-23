class Solution {
    func smallestSubsequence(_ s: String) -> String {
        var stack: [Character] = []
        var inStack = Set<Character>()
        var lastIndex = [Character: Int]()
        
        for (i, char) in s.enumerated() {
            lastIndex[char] = i
        }
        
        for (i, char) in s.enumerated() {
            if inStack.contains(char) { continue }
            
            while let last = stack.last, last > char, lastIndex[last]! > i {
                inStack.remove(last)
                stack.removeLast()
            }
            
            stack.append(char)
            inStack.insert(char)
        }
        
        return String(stack)
    }
}
