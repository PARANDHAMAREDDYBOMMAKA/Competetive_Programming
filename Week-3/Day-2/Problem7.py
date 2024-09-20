# Given an array of points where points[i] = [xi, yi] represents a point on the X-Y plane, return the maximum number of points that lie on the same straight line.

# Example 1:

# Input: points = [[1,1],[2,2],[3,3]]
# Output: 3
# Example 2:

# Input: points = [[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]]
# Output: 4

# Constraints:

# 1 <= points.length <= 300
# points[i].length == 2
# -104 <= xi, yi <= 104
# All the points are unique.

# https://leetcode.com/problems/max-points-on-a-line/

class Solution:
    def maxPoints(self, points: List[List[int]]) -> int:
        def getSlope(p1, p2):
            dx = p2[0] - p1[0]
            dy = p2[1] - p1[1]
            if dx == 0:
                return (float('inf'), float('inf'))
            g = gcd(dy, dx)
            return (dy // g, dx // g)

        if len(points) < 2:
            return len(points)

        maxPoints = 0

        for i in range(len(points)):
            slopes = defaultdict(int)
            duplicate = 0
            for j in range(len(points)):
                if i == j:
                    continue
                if points[i] == points[j]:
                    duplicate += 1
                else:
                    slope = getSlope(points[i], points[j])
                    slopes[slope] += 1
            currentMax = duplicate
            for count in slopes.values():
                currentMax = max(currentMax, count + duplicate)
            maxPoints = max(maxPoints, currentMax + 1)

        return maxPoints