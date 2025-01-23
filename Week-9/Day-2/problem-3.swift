class Solution {
    func largestNumber(_ nums: [Int]) -> String {
        let strs = nums.map { String($0) }
        let sortedStrs = strs.sorted { $0 + $1 > $1 + $0 }
        if sortedStrs.first == "0" {
            return "0"
        }
        return sortedStrs.joined()
    }
}
