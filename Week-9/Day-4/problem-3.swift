class Solution {
    var time = 0
    var result = [[Int]]()
    
    func criticalConnections(_ n: Int, _ connections: [[Int]]) -> [[Int]] {
        var graph = [[Int]: [Int]]()
        var disc = Array(repeating: -1, count: n)
        var low = Array(repeating: -1, count: n)
        var parent = Array(repeating: -1, count: n)
        
        // Build the graph
        for edge in connections {
            graph[edge[0], default: []].append(edge[1])
            graph[edge[1], default: []].append(edge[0])
        }
        
        for i in 0..<n {
            if disc[i] == -1 {
                dfs(i, &disc, &low, &parent, &graph)
            }
        }
        
        return result
    }
    
    func dfs(_ u: Int, _ disc: inout [Int], _ low: inout [Int], _ parent: inout [Int], _ graph: inout [[Int]: [Int]]) {
        disc[u] = low[u] = time
        time += 1
        
        for v in graph[u]! {
            if disc[v] == -1 {
                parent[v] = u
                dfs(v, &disc, &low, &parent, &graph)
                
                low[u] = min(low[u], low[v])
                
                if low[v] > disc[u] {
                    result.append([u, v])
                }
            } else if v != parent[u] {
                low[u] = min(low[u], disc[v])
            }
        }
    }
}
