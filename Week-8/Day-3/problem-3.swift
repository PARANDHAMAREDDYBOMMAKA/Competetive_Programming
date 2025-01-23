class MedianFinder {
    var minHeap: [Int] = []
    var maxHeap: [Int] = []
    
    init() {}
    
    func addNum(_ num: Int) {
        if maxHeap.isEmpty || num <= maxHeap[0] {
            maxHeap.append(num)
            maxHeap.sort()
        } else {
            minHeap.append(num)
            minHeap.sort()
        }
        
        if maxHeap.count > minHeap.count + 1 {
            minHeap.append(maxHeap.removeFirst())
            minHeap.sort()
        }
        
        if minHeap.count > maxHeap.count {
            maxHeap.append(minHeap.removeFirst())
            maxHeap.sort()
        }
    }
    
    func findMedian() -> Double {
        if maxHeap.count > minHeap.count {
            return Double(maxHeap[0])
        }
        return Double(maxHeap[0] + minHeap[0]) / 2
    }
}
