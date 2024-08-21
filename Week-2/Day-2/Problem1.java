// Given an m x n binary matrix mat, return the distance of the nearest 0 for each cell.

// The distance between two adjacent cells is 1.

 

// Example 1:


// Input: mat = [[0,0,0],[0,1,0],[0,0,0]]
// Output: [[0,0,0],[0,1,0],[0,0,0]]
// Example 2:


// Input: mat = [[0,0,0],[0,1,0],[1,1,1]]
// Output: [[0,0,0],[0,1,0],[1,2,1]]
 

// Constraints:

// m == mat.length
// n == mat[i].length
// 1 <= m, n <= 104
// 1 <= m * n <= 104
// mat[i][j] is either 0 or 1.
// There is at least one 0 in mat.


// https://leetcode.com/problems/01-matrix/description/

// Solution:
import java.util.*;

class Solution {
    public int[][] updateMatrix(int[][] mat) {
        int rows = mat.length;
        int cols = mat[0].length;
        int[][] dist = new int[rows][cols];
        Queue<int[]> queue = new LinkedList<>();

        for(int i=0;i<rows;i++){
            for(int j=0;j<cols;j++){
                if(mat[i][j]==0){
                    dist[i][j] =0;
                    queue.offer(new int[]{i,j});
                }else{
                    dist[i][j] = Integer.MAX_VALUE;
                }
            }
        }
        int[][] directions = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
        while(!queue.isEmpty()){
            int[] cell = queue.poll();
            int row = cell[0];
            int col = cell[1];
            for(int[] dir : directions){
                int newRow = row+dir[0];
                int newCol = col+dir[1];

                if(newRow >= 0&& newRow<rows&&newCol>=0&&newCol<cols){
                    if(dist[newRow][newCol]> dist[row][col]+1){
                        dist[newRow][newCol] = dist[row][col] +1;
                        queue.offer(new int[]{newRow,newCol});
                    }
                }
            }
        }
        return dist;
    }
}