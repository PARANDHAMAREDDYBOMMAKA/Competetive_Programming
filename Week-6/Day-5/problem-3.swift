class Solution {
    func minNumberOfSemesters(_ n: Int, _ dependencies: [[Int]], _ k: Int) -> Int {
        var graph = [Int: [Int]]()
        var inDegree = Array(repeating: 0, count: n)
        
        for dep in dependencies {
            graph[dep[0] - 1, default: []].append(dep[1] - 1)
            inDegree[dep[1] - 1] += 1
        }
        
        var queue = [Int]()
        for i in 0..<n {
            if inDegree[i] == 0 {
                queue.append(i)
            }
        }
        
        var semesters = 0
        while !queue.isEmpty {
            semesters += 1
            var temp = [Int]()
            for i in queue {
                for neighbor in graph[i, default: []] {
                    inDegree[neighbor] -= 1
                    if inDegree[neighbor] == 0 {
                        temp.append(neighbor)
                    }
                }
            }
            queue = Array(temp.prefix(k))
        }
        
        return semesters
    }
}
