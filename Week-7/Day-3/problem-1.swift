class Solution {
    func isRobotBounded(_ instructions: String) -> Bool {
        var direction = 0
        var x = 0, y = 0
        
        for instruction in instructions {
            if instruction == "G" {
                if direction == 0 { y += 1 }
                else if direction == 1 { x += 1 }
                else if direction == 2 { y -= 1 }
                else { x -= 1 }
            } else if instruction == "L" {
                direction = (direction + 3) % 4
            } else if instruction == "R" {
                direction = (direction + 1) % 4
            }
        }
        
        return (x == 0 && y == 0) || direction != 0
    }
}
