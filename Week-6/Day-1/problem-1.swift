class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        if dividend == Int32.min && divisor == -1 {
            return Int(Int32.max)
        }
        let sign = (dividend < 0) != (divisor < 0) ? -1 : 1
        var dividend = abs(dividend)
        var divisor = abs(divisor)
        var quotient = 0
        
        while dividend >= divisor {
            var temp = divisor
            var multiple = 1
            while dividend >= (temp << 1) {
                temp <<= 1
                multiple <<= 1
            }
            dividend -= temp
            quotient += multiple
        }
        return sign * quotient
    }
}
