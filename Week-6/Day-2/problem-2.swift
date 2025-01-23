class Solution {
    func canConstruct(_ s: String, _ k: Int) -> Bool {
        let count = s.reduce(into: [Character: Int]()) { $0[$1, default: 0] += 1 }
        let oddCount = count.values.filter { $0 % 2 == 1 }.count
        return oddCount <= k && s.count >= k
    }
}
