class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var freqMap: [Int: Int] = [:]
        for num in nums {
            freqMap[num, default: 0] += 1
        }
        
        var freqArray = Array(freqMap.values)
        freqArray.sort { $0 > $1 }
        
        var result: [Int] = []
        for (key, value) in freqMap {
            if value == freqArray[k - 1] {
                result.append(key)
            }
        }
        
        return result
    }
}
