class Solution {
    func totalHammingDistance(_ nums: [Int]) -> Int {
        var total = 0
        for i in 0..<32 {
            var ones = 0
            for num in nums {
                ones += (num >> i) & 1
            }
            total += ones * (nums.count - ones)
        }
        return total
    }
}
