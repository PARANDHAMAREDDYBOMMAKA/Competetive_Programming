class Solution {
    func fib(_ n: Int) -> Int {
        if n == 0 { return 0 }
        if n == 1 { return 1 }
        
        var a = 0, b = 1
        for _ in 2...n {
            let temp = a + b
            a = b
            b = temp
        }
        return b
    }
}
