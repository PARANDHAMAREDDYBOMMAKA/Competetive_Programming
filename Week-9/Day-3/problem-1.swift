class Solution {
    func xorQueries(_ arr: [Int], _ queries: [[Int]]) -> [Int] {
        var prefixXor = [0]
        for num in arr {
            prefixXor.append(prefixXor.last! ^ num)
        }
        
        return queries.map { prefixXor[$0[1] + 1] ^ prefixXor[$0[0]] }
    }
}
