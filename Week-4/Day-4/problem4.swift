class Solution {
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        var m = m
        var n = n
        var shift = 0
        while m < n {
            m >>= 1
            n >>= 1
            shift += 1
        }
        return m << shift
    }
}
