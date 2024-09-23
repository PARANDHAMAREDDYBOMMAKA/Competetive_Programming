// Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

// An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.


// Example 1:

// Input: grid = [
//   ["1","1","1","1","0"],
//   ["1","1","0","1","0"],
//   ["1","1","0","0","0"],
//   ["0","0","0","0","0"]
// ]
// Output: 1
// Example 2:

// Input: grid = [
//   ["1","1","0","0","0"],
//   ["1","1","0","0","0"],
//   ["0","0","1","0","0"],
//   ["0","0","0","1","1"]
// ]
// Output: 3
 

// Constraints:

// m == grid.length
// n == grid[i].length
// 1 <= m, n <= 300
// grid[i][j] is '0' or '1'.



// https://leetcode.com/problems/number-of-islands/

class Solution {
    public int numIslands(char[][] grid) {
        if (grid == null || grid.length == 0) return 0;
        
        int rows = grid.length;
        int cols = grid[0].length;
        int noOfIslands = 0;

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (grid[i][j] == '1') {
                    noOfIslands++;
                    grid[i][j] = '0';
                    int[] rowDirs = {-1, 1, 0, 0};
                    int[] colDirs = {0, 0, -1, 1};
                    int[] stack = new int[rows * cols];
                    int top = -1;
                    stack[++top] = i * cols + j;

                    while (top >= 0) {
                        int pos = stack[top--];
                        int x = pos / cols;
                        int y = pos % cols;

                        for (int d = 0; d < 4; d++) {
                            int ni = x + rowDirs[d];
                            int nj = y + colDirs[d];
                            if (ni >= 0 && ni < rows && nj >= 0 && nj < cols && grid[ni][nj] == '1') {
                                grid[ni][nj] = '0';
                                stack[++top] = ni * cols + nj;
                            }
                        }
                    }
                }
            }
        }

        return noOfIslands;
    }
}