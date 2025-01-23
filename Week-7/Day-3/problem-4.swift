class Solution {
    func chunkArray(_ nums: [Int], _ k: Int) -> [[Int]] {
        var result: [[Int]] = []
        var temp: [Int] = []
        
        for num in nums {
            temp.append(num)
            if temp.count == k {
                result.append(temp)
                temp = []
            }
        }
        
        if !temp.isEmpty {
            result.append(temp)
        }
        
        return result
    }
}
