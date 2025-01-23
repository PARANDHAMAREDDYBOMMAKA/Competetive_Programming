class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result = [Int](repeating: 0, count: temperatures.count)
        var stack: [Int] = []
        
        for i in 0..<temperatures.count {
            while !stack.isEmpty && temperatures[i] > temperatures[stack.last!] {
                let idx = stack.removeLast()
                result[idx] = i - idx
            }
            stack.append(i)
        }
        
        return result
    }
}
