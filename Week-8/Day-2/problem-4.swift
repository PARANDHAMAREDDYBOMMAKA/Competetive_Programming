class StockSpanner {
    var stack: [(Int, Int)] = []
    
    init() {}
    
    func next(_ price: Int) -> Int {
        var span = 1
        while !stack.isEmpty && stack.last!.0 <= price {
            span += stack.removeLast().1
        }
        stack.append((price, span))
        return span
    }
}
