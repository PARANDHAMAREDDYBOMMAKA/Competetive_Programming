class Solution {
    func findCenter(_ edges: [[Int]]) -> Int {
        let firstEdge = edges[0]
        let secondEdge = edges[1]
        return firstEdge[0] == secondEdge[0] || firstEdge[0] == secondEdge[1] ? firstEdge[0] : firstEdge[1]
    }
}
