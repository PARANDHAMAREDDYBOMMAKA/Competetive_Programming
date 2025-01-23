class Solution {
    var graph = [Int: [Int]]()
    var visited = [Bool]()
    var discoveryTime = [Int]()
    var lowTime = [Int]()
    var time = 0
    var result = [[Int]]()
    
    func criticalConnections(_ n: Int, _ connections: [[Int]]) -> [[Int]] {
        graph = [Int: [Int]]()
        visited = Array(repeating: false, count: n)
        discoveryTime = Array(repeating: -1, count: n)
        lowTime = Array(repeating: -1, count: n)
        
        for connection in connections {
            let (u, v) = (connection[0], connection[1])
            graph[u, default: []].append(v)
            graph[v, default: []].append(u)
        }
        
        for i in 0..<n {
            if !visited[i] {
                dfs(i, -1)
            }
        }
        
        return result
    }
    
    func dfs(_ node: Int, _ parent: Int) {
        visited[node] = true
        discoveryTime[node] = lowTime[node] = time
        time += 1
        
        for neighbor in graph[node]! {
            if neighbor == parent { continue }
            if !visited[neighbor] {
                dfs(neighbor, node)
                lowTime[node] = min(lowTime[node], lowTime[neighbor])
                if lowTime[neighbor] > discoveryTime[node] {
                    result.append([node, neighbor])
                }
            } else {
                lowTime[node] = min(lowTime[node], discoveryTime[neighbor])
            }
        }
    }
}
