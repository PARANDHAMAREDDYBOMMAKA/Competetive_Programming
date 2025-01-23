class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted(by: >)
        return nums[k - 1]
    }
}
