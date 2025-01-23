class Solution {
    func maximumUnits(_ boxTypes: [[Int]], _ truckSize: Int) -> Int {
        let sortedBoxTypes = boxTypes.sorted { $0[1] > $1[1] }
        var remainingTruckSize = truckSize
        var units = 0
        
        for box in sortedBoxTypes {
            let boxCount = box[0]
            let unitCount = box[1]
            
            if remainingTruckSize == 0 { break }
            
            let boxesToLoad = min(boxCount, remainingTruckSize)
            units += boxesToLoad * unitCount
            remainingTruckSize -= boxesToLoad
        }
        
        return units
    }
}
