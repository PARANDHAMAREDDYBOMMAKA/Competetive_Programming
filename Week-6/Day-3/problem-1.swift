class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let merged = (nums1 + nums2).sorted()
        let n = merged.count
        if n % 2 == 1 {
            return Double(merged[n / 2])
        } else {
            return Double(merged[n / 2 - 1] + merged[n / 2]) / 2
        }
    }
}
