class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        let n = gas.count
        var totalGas = 0
        var totalCost = 0
        var currentGas = 0
        var startIndex = 0
        
        for i in 0..<n {
            totalGas += gas[i]
            totalCost += cost[i]
            currentGas += gas[i] - cost[i]
            
            if currentGas < 0 {
                currentGas = 0
                startIndex = i + 1
            }
        }
        
        return totalGas >= totalCost ? startIndex : -1
    }
}
