class Solution {
    func getSkyline(_ buildings: [[Int]]) -> [[Int]] {
        var events = [(Int, Int)]()
        for building in buildings {
            events.append((building[0], -building[2])) // Start of building
            events.append((building[1], building[2])) // End of building
        }
        
        events.sort { $0.0 == $1.0 ? $0.1 > $1.1 : $0.0 < $1.0 }
        
        var result = [[Int]]()
        var heights = [0]
        
        for (x, h) in events {
            if h < 0 { heights.append(-h) }
            else { heights.removeAll { $0 == h } }
            
            let maxHeight = heights.max() ?? 0
            if result.isEmpty || result.last![1] != maxHeight {
                result.append([x, maxHeight])
            }
        }
        
        return result
    }
}
