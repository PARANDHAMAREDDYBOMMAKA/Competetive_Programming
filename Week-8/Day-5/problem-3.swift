class Solution {
    func countOfSmallerNumbers(_ nums: [Int]) -> [Int] {
        var result: [Int] = []
        var sorted = [Int]()
        
        for num in nums {
            let count = sorted.binarySearch(num)
            result.append(count)
            sorted.insert(num)
        }
        
        return result
    }
}

extension Array where Element: Comparable {
    func binarySearch(_ value: Element) -> Int {
        var left = 0
        var right = count
        
        while left < right {
            let mid = (left + right) / 2
            if self[mid] < value {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        return left
    }
}
