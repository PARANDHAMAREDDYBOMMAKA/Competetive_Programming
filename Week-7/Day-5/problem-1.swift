class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        let n = gas.count
        var total = 0
        var current = 0
        var start = 0
        
        for i in 0..<n {
            total += gas[i] - cost[i]
            current += gas[i] - cost[i]
            if current < 0 {
                start = i + 1
                current = 0
            }
        }
        
        return total < 0 ? -1 : start
    }
}
