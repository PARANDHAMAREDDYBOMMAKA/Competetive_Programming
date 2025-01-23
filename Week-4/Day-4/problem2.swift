class NumArray {
    var segTree: [Int]
    var n: Int
    
    init(_ nums: [Int]) {
        n = nums.count
        segTree = Array(repeating: 0, count: 2 * n)
        for i in 0..<n {
            segTree[i + n] = nums[i]
        }
        for i in stride(from: n - 1, through: 1, by: -1) {
            segTree[i] = segTree[2 * i] + segTree[2 * i + 1]
        }
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        var left = left + n
        var right = right + n
        var sum = 0
        while left <= right {
            if left % 2 == 1 {
                sum += segTree[left]
                left += 1
            }
            if right % 2 == 0 {
                sum += segTree[right]
                right -= 1
            }
            left /= 2
            right /= 2
        }
        return sum
    }
}
