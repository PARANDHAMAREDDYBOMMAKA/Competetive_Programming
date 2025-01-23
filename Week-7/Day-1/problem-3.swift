class NumArray {
    var segmentTree: [Int]
    var nums: [Int]
    
    init(_ nums: [Int]) {
        self.nums = nums
        self.segmentTree = Array(repeating: 0, count: nums.count * 2)
        for i in 0..<nums.count {
            segmentTree[nums.count + i] = nums[i]
        }
        for i in (1..<nums.count).reversed() {
            segmentTree[i] = segmentTree[i*2] + segmentTree[i*2 + 1]
        }
    }
    
    func update(_ index: Int, _ val: Int) {
        var idx = index + nums.count
        segmentTree[idx] = val
        while idx > 1 {
            idx /= 2
            segmentTree[idx] = segmentTree[idx*2] + segmentTree[idx*2 + 1]
        }
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        var left = left + nums.count
        var right = right + nums.count
        var result = 0
        while left <= right {
            if left % 2 == 1 {
                result += segmentTree[left]
                left += 1
            }
            if right % 2 == 0 {
                result += segmentTree[right]
                right -= 1
            }
            left /= 2
            right /= 2
        }
        return result
    }
}
