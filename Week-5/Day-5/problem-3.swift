class Solution {
    func pancakeSort(_ A: [Int]) -> [Int] {
        var A = A
        var result = [Int]()
        
        func flip(_ k: Int) {
            A[0..<k].reverse()
            result.append(k)
        }
        
        for i in (1..<A.count + 1).reversed() {
            if A[0] != i {
                let index = A.firstIndex(of: i)!
                if index != 0 {
                    flip(index + 1)
                }
                flip(i)
            }
        }
        
        return result
    }
}
