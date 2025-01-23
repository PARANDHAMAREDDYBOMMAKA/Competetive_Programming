class Solution {
    func rectangleArea(_ rectangles: [[Int]]) -> Int {
        let MOD = 1_000_000_007
        
        var events: [(Int, Int, Int, Int)] = []
        for rect in rectangles {
            events.append((rect[0], 1, rect[1], rect[3]))
            events.append((rect[2], -1, rect[1], rect[3]))
        }
        
        events.sort { $0.0 < $1.0 }
        
        var active: [(Int, Int)] = []
        var prevX = 0
        var result = 0
        
        for (x, eventType, y1, y2) in events {
            result = (result + (x - prevX) * calculateLength(active) % MOD) % MOD
            prevX = x
            if eventType == 1 {
                active.append((y1, y2))
            } else {
                active.removeAll { $0 == (y1, y2) }
            }
        }
        
        return result
    }
    
    func calculateLength(_ active: [(Int, Int)]) -> Int {
        var length = 0
        var prev = -1
        for (start, end) in active.sorted(by: { $0.0 < $1.0 }) {
            if prev < start {
                length += end - start
                prev = end
            } else {
                prev = max(prev, end)
            }
        }
        return length
    }
}
