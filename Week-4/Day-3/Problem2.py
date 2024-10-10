# Given an m x n board of characters and a list of strings words, return all words on the board.

# Each word must be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.

 

# Example 1:


# Input: board = [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], words = ["oath","pea","eat","rain"]
# Output: ["eat","oath"]
# Example 2:


# Input: board = [["a","b"],["c","d"]], words = ["abcb"]
# Output: []
 

# Constraints:

# m == board.length
# n == board[i].length
# 1 <= m, n <= 12
# board[i][j] is a lowercase English letter.
# 1 <= words.length <= 3 * 104
# 1 <= words[i].length <= 10
# words[i] consists of lowercase English letters.
# All the strings of words are unique.



# https://leetcode.com/problems/word-search-ii/



class TrieNode:
    def __init__(self):
        self.children = {}
        self.isEndOfWord = False

class Solution:
    def findWords(self, board: List[List[str]], words: List[str]) -> List[str]:
        root = TrieNode()
        
        def insert(word):
            node = root
            for char in word:
                if char not in node.children:
                    node.children[char] = TrieNode()
                node = node.children[char]
            node.isEndOfWord = True
        
        for word in words:
            insert(word)
        
        result = set()
        rows, cols = len(board), len(board[0])

        def dfs(i, j, node, path):
            if node.isEndOfWord:
                result.add(path)
                node.isEndOfWord = False  # To avoid duplicate results

            if i < 0 or i >= rows or j < 0 or j >= cols or board[i][j] not in node.children:
                return
            
            temp = board[i][j]
            board[i][j] = "#"
            nextNode = node.children[temp]

            dfs(i + 1, j, nextNode, path + temp)
            dfs(i - 1, j, nextNode, path + temp)
            dfs(i, j + 1, nextNode, path + temp)
            dfs(i, j - 1, nextNode, path + temp)

            board[i][j] = temp

        for i in range(rows):
            for j in range(cols):
                if board[i][j] in root.children:
                    dfs(i, j, root, "")

        return list(result)