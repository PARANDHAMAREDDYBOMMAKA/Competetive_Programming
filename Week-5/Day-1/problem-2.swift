class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        var parent = Array(0..<edges.count + 1)
        
        func find(_ x: Int) -> Int {
            if parent[x] != x {
                parent[x] = find(parent[x])
            }
            return parent[x]
        }
        
        func union(_ x: Int, _ y: Int) {
            let rootX = find(x)
            let rootY = find(y)
            if rootX != rootY {
                parent[rootX] = rootY
            }
        }
        
        for edge in edges {
            let (x, y) = (edge[0], edge[1])
            if find(x) == find(y) {
                return edge
            }
            union(x, y)
        }
        return []
    }
}
