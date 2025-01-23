class Solution {
    func countPrimeSetBits(_ L: Int, _ R: Int) -> Int {
        let primes = Set([2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31])
        var result = 0
        for num in L...R {
            let setBits = countSetBits(num)
            if primes.contains(setBits) {
                result += 1
            }
        }
        return result
    }
    
    private func countSetBits(_ n: Int) -> Int {
        var count = 0
        var n = n
        while n > 0 {
            count += n & 1
            n >>= 1
        }
        return count
    }
}
