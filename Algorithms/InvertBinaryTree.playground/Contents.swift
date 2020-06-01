import Foundation

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

//Leetcode 226. Invert Binary Tree
//https://leetcode.com/problems/invert-binary-tree/
func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard let node = root else { return nil }
    
    invertTree(node.left)
    invertTree(node.right)
    
    let temp = node.left
    node.left = node.right
    node.right = temp
    
    return node
}
