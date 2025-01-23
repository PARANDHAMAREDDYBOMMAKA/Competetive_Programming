class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        let num1 = Array(num1).reversed()
        let num2 = Array(num2).reversed()
        var result = Array(repeating: 0, count: num1.count + num2.count)
        
        for i in 0..<num1.count {
            for j in 0..<num2.count {
                let product = (Int(String(num1[i]))! * Int(String(num2[j]))!)
                result[i + j] += product
                result[i + j + 1] += result[i + j] / 10
                result[i + j] %= 10
            }
        }
        
        while result.count > 1 && result.last == 0 {
            result.removeLast()
        }
        
        return result.reversed().map { String($0) }.joined()
    }
}
