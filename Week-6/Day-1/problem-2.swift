class Solution {
    func isPowerOfFour(_ num: Int) -> Bool {
        return num > 0 && num & (num - 1) == 0 && (num - 1) % 3 == 0
    }
}
