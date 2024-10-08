# You are given an array of points in the X-Y plane points where points[i] = [xi, yi].

# Return the minimum area of any rectangle formed from these points, with sides not necessarily parallel to the X and Y axes. If there is not any such rectangle, return 0.

# Answers within 10-5 of the actual answer will be accepted.

 

# Example 1:


# Input: points = [[1,2],[2,1],[1,0],[0,1]]
# Output: 2.00000
# Explanation: The minimum area rectangle occurs at [1,2],[2,1],[1,0],[0,1], with an area of 2.
# Example 2:


# Input: points = [[0,1],[2,1],[1,1],[1,0],[2,0]]
# Output: 1.00000
# Explanation: The minimum area rectangle occurs at [1,0],[1,1],[2,1],[2,0], with an area of 1.
# Example 3:


# Input: points = [[0,3],[1,2],[3,1],[1,3],[2,1]]
# Output: 0
# Explanation: There is no possible rectangle to form from these points.
 

# Constraints:

# 1 <= points.length <= 50
# points[i].length == 2
# 0 <= xi, yi <= 4 * 104
# All the given points are unique.


# https://leetcode.com/problems/minimum-area-rectangle-ii/

class Solution:
    def minAreaFreeRect(self, points: List[List[int]]) -> float:
        pointSet = {tuple(p) for p in points}
        minArea = float('inf')
        
        for p1, p2, p3 in itertools.combinations(points, 3):
            if (p2[0] - p1[0]) * (p3[0] - p1[0]) + (p2[1] - p1[1]) * (p3[1] - p1[1]) == 0:
                p4 = (p3[0] + p2[0] - p1[0], p3[1] + p2[1] - p1[1])
                if p4 in pointSet:
                    area = math.dist(p1, p2) * math.dist(p1, p3)
                    if area > 0:
                        minArea = min(minArea, area)
        
        return minArea if minArea < float('inf') else 0.0