class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var n = n
        var x = x
        if n < 0 {
            x = 1 / x
            n = -n
        }
        var result = 1.0
        while n > 0 {
            if n % 2 == 1 {
                result *= x
            }
            x *= x
            n /= 2
        }
        return result
    }
}
