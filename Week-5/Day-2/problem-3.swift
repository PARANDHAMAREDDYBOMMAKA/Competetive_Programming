class Solution {
    func reversePairs(_ nums: [Int]) -> Int {
        func mergeSort(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
            if left >= right { return 0 }
            let mid = (left + right) / 2
            let leftCount = mergeSort(&nums, left, mid)
            let rightCount = mergeSort(&nums, mid + 1, right)
            var count = leftCount + rightCount
            var j = mid + 1
            for i in left...mid {
                while j <= right && nums[i] > 2 * nums[j] {
                    j += 1
                }
                count += j - (mid + 1)
            }
            nums = merge(nums, left, mid, right)
            return count
        }

        func merge(_ nums: [Int], _ left: Int, _ mid: Int, _ right: Int) -> [Int] {
            var temp = [Int]()
            var i = left, j = mid + 1
            while i <= mid && j <= right {
                if nums[i] <= nums[j] {
                    temp.append(nums[i])
                    i += 1
                } else {
                    temp.append(nums[j])
                    j += 1
                }
            }
            while i <= mid {
                temp.append(nums[i])
                i += 1
            }
            while j <= right {
                temp.append(nums[j])
                j += 1
            }
            return temp
        }

        var nums = nums
        return mergeSort(&nums, 0, nums.count - 1)
    }
}
