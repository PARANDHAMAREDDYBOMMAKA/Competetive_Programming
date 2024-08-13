// A matrix diagonal is a diagonal line of cells starting from some cell in either the topmost row or leftmost column and going in the bottom-right direction until reaching the matrix's end. For example, the matrix diagonal starting from mat[2][0], where mat is a 6 x 3 matrix, includes cells mat[2][0], mat[3][1], and mat[4][2].

// Given an m x n matrix mat of integers, sort each matrix diagonal in ascending order and return the resulting matrix.

 

// Example 1:


// Input: mat = [[3,3,1,1],[2,2,1,2],[1,1,1,2]]
// Output: [[1,1,1,1],[1,2,2,2],[1,2,3,3]]
// Example 2:

// Input: mat = [[11,25,66,1,69,7],[23,55,17,45,15,52],[75,31,36,44,58,8],[22,27,33,25,68,4],[84,28,14,11,5,50]]
// Output: [[5,17,4,1,52,7],[11,11,25,45,8,69],[14,23,25,44,58,15],[22,27,31,36,50,66],[84,28,75,33,55,68]]
 

// Constraints:

// m == mat.length
// n == mat[i].length
// 1 <= m, n <= 100
// 1 <= mat[i][j] <= 100

// https://leetcode.com/problems/sort-the-matrix-diagonally/description/

// Solution:
import java.util.*;

class Solution {
    public int[][] diagonalSort(int[][] mat) {
        int n = mat.length;
        int n2 = mat[0].length;
        int[][] diagonals = new int[n + n2 - 1][];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n2; j++) {
                int diagIndex = i - j + (n2 - 1);
                if (diagonals[diagIndex] == null) {
                    diagonals[diagIndex] = new int[Math.min(n, n2)];
                }
                diagonals[diagIndex][Math.min(i, j)] = mat[i][j];
            }
        }
        for (int[] diagonal : diagonals) {
            if (diagonal != null) {
                int length = 0;
                for (int value : diagonal) {
                    if (value != 0) length++;
                }
                Arrays.sort(diagonal, 0, length);
            }
        }
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n2; j++) {
                int diagIndex = i - j + (n2 - 1);
                @SuppressWarnings("unused")
                int length = 0;
                for (int value : diagonals[diagIndex]) {
                    if (value != 0) length++;
                }
                mat[i][j] = diagonals[diagIndex][Math.min(i, j)];
                diagonals[diagIndex][Math.min(i, j)] = 0;
            }
        }

        return mat; 
    }
}