class Solution {
    func countInversions(_ arr: [Int]) -> Int {
        var arrCopy = arr
        return mergeSort(&arrCopy, left: 0, right: arr.count - 1)
    }
    
    private func mergeSort(_ arr: inout [Int], left: Int, right: Int) -> Int {
        var invCount = 0
        if left < right {
            let mid = (left + right) / 2
            invCount += mergeSort(&arr, left: left, right: mid)
            invCount += mergeSort(&arr, left: mid + 1, right: right)
            invCount += merge(&arr, left: left, mid: mid, right: right)
        }
        return invCount
    }
    
    private func merge(_ arr: inout [Int], left: Int, mid: Int, right: Int) -> Int {
        var invCount = 0
        var leftArr = Array(arr[left...mid])
        var rightArr = Array(arr[mid+1...right])
        
        var i = 0
        var j = 0
        var k = left
        
        while i < leftArr.count && j < rightArr.count {
            if leftArr[i] <= rightArr[j] {
                arr[k] = leftArr[i]
                i += 1
            } else {
                arr[k] = rightArr[j]
                invCount += leftArr.count - i
                j += 1
            }
            k += 1
        }
        
        while i < leftArr.count {
            arr[k] = leftArr[i]
            i += 1
            k += 1
        }
        
        while j < rightArr.count {
            arr[k] = rightArr[j]
            j += 1
            k += 1
        }
        
        return invCount
    }
}
