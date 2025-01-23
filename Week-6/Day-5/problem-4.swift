class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var graph = [Int: [(Int, Int)]]()
        for time in times {
            graph[time[0], default: []].append((time[1], time[2]))
        }
        
        var dist = Array(repeating: Int.max, count: n)
        dist[k - 1] = 0
        var pq = [(0, k - 1)]
        
        while !pq.isEmpty {
            let (d, node) = pq.removeFirst()
            if d > dist[node] { continue }
            
            for (nextNode, weight) in graph[node, default: []] {
                let newDist = d + weight
                if newDist < dist[nextNode] {
                    dist[nextNode] = newDist
                    pq.append((newDist, nextNode))
                }
            }
        }
        
        let maxDist = dist.max()!
        return maxDist == Int.max ? -1 : maxDist
    }
}
