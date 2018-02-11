//
//  main.swift
//  BinarySearchTree
//
//  Created by Bharat Bhushan on 10/02/18.
//  Copyright © 2018 Bharat Bhushan. All rights reserved.
//

import Foundation

class BinarySearchTree<T: Comparable> {
    var left: BinarySearchTree? = nil
    var right: BinarySearchTree? = nil
    var data: T?
    
    func insert(key: T) {
        //Case to handle root node
        if data == nil {
            self.data = key
            return
        }
        
        //case to handle other nodes
        if let data = data, key <= data {
            if left == nil {
                let newNode = BinarySearchTree()
                newNode.data = key
                self.left = newNode
                
                
            } else {
                left?.insert(key: key)
            }
        } else {
            if right == nil {
                let newNode = BinarySearchTree()
                newNode.data = key
                self.right = newNode
            } else {
                right?.insert(key: key)
            }
        }
    }
    
    func preOrderTraversal(_ root: BinarySearchTree?) {
        var root = root
        //Recursive way to print nodes of a tree
        /*
         if root == nil {
         return
         }
         print(root?.data ?? "No data available")
         preOrderTraversal(root?.left)
         preOrderTraversal(root?.right)
         */
        
        var stack = [BinarySearchTree]()
        
        
        //Root --->  left Subtree --->  then right Subtree
        while (true) {
            
            while root != nil {
                //Print the root
                print(root?.data ?? "nothing")
                
                //make root = root -> left
                root = root?.left
                if let left = root?.left {
                    stack.append(left)
                }
            }
            // traverse the right subtree
            if stack.isEmpty {
                return
            } else {
                root = stack.popLast()
                root = root?.right
            }
        }
    }
    
    func inOrderTraversal(_ root: BinarySearchTree?) {
        var root = root
        /*
        if root == nil {
            return
        }
        
        inOrderTraversal(root?.left)
        print(root?.data ?? "No data available")
        inOrderTraversal(root?.right)
 
         */
        
        var stack = [BinarySearchTree]()
        
        while true {
            while root != nil {
                stack.append(root!)
                root = root?.left
            }
            
            if stack.isEmpty {
                return
            } else {
                root = stack.popLast()
                print(root?.data ?? "nothing")
                root = root?.right
            }
        }
    }
    
    func postOrderTraversal(_ root: BinarySearchTree?) {
        if root == nil {
            return
        }
        
        postOrderTraversal(root?.left)
        postOrderTraversal(root?.right)
        print(root?.data ?? "No data available")
        
    }
}

let items = [8, 2, 10, 9, 11, 1, 7]

let root = BinarySearchTree<Int>()
for item in items {
        root.insert(key: item)
}


//print("############ PreOrder Traversal Tree ############")
//root.preOrderTraversal(root)
print("############ InOrderTraversal Tree ############")
root.inOrderTraversal(root)
//print("############ PostOrderTraversal Tree ############")
//root.postOrderTraversal(root)


