//
//  LRUCache.swift
//  IceCache
//
//  Created by Harry Twan on 2018/6/2.
//  Copyright © 2018年 Gua. All rights reserved.
//

import UIKit

public final class LinkedList<ValueType> {
    
    /// Node Basic DS Decalaration
    public class LinkedListNode<ValueType> {
        var value: ValueType
        var next: LinkedListNode?
        weak var previous: LinkedListNode?
        
        public init(value: ValueType) {
            self.value = value
        }
    }
    
    /// Typealiasing the node class
    public typealias Node = LinkedListNode<ValueType>
    
    /// The count of the Linked List Node
    private(set) var count: Int
    
    /// The head of the Linked List
    private(set) var head: Node?
    
    /// The tail of the Linked List
    public var tail: Node? {
        guard var node = head else {
            return nil
        }
        // TODO: to be optimized
        while let next = node.next {
            node = next
        }
        return node
    }
    
    public init() {
        count = 0
    }
}

/// MARK: - Computed property
public extension LinkedList {
    
    /// Computed property to check if the linked list is empty
    public var isEmpty: Bool {
        return head == nil
    }
}


// MARK: - Subscript
public extension LinkedList {
    
    public subscript(index: Int) -> ValueType? {
        return node(at: index)?.value ?? nil
    }
}


// MARK: - API
public extension LinkedList {
    
    /// Function to return the node at a specific index. (0...self.count)
    /// If the index is out of the bounds, function will return nil
    ///
    /// - Parameter index: Integer value of the node's index to be returned
    /// - Returns: LinkedListNode? => Node?
    public func node(at index: Int) -> Node? {
        if index < count {
            var iterativeTime = index
            var node = head
            while iterativeTime != 0 && node != nil {
                iterativeTime -= 1
                node = head?.next
            }
            return node
        }
        return nil
    }
    
    /// Append a value to the end of the list auto transform a Node object
    ///
    /// - Parameter value: The data value to be appended
    public func append(_ value: ValueType) {
        let newNode = Node(value: value)
        append(newNode)
    }
    
    /// Append a copy of a LinkedListNode to the end of the list.
    ///
    /// - Parameter node: The node containing the value to be appended
    public func append(_ node: Node) {
        let newNode = node
        if let lastNode = tail {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
        count += 1
    }
    
    public func insert(_ newNode: Node, at index: Int) {
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let prev = node(at: index - 1)
            let next = prev?.next
            newNode.previous = prev
            newNode.next = next
            next?.previous = newNode
            prev?.next = newNode
        }
        count += 1
    }
    
    @discardableResult public func remove(node: Node) -> ValueType {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        node.previous = nil
        node.next = nil
        
        count -= 1
        return node.value
    }
}

public class LRUCache<KeyType: Hashable, ValueType> {
    
    typealias Node = LinkedList<ValueType>.LinkedListNode<ValueType>
    
    private(set) var capacity: Int
    
    private var priority: LinkedList<ValueType> = LinkedList<ValueType>()
    
    private var hashMap: [KeyType: Node] = [:]
    
    public init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    /// Test Property
    public var description: String {
        var result = ""
        guard let head = priority.head else {
            return "Empty"
        }
        
        result += "[\(head.value)]"
        var node = head
        while let iterate = node.next {
            result += " -> [\(iterate.value)]"
            node = iterate
        }
        return result
    }
}

// MARK: - API
public extension LRUCache {
    public func get(_ key: KeyType) -> ValueType? {
        guard let node = hashMap[key] else {
            return nil
        }
        priority.remove(node: node)
        priority.insert(node, at: 0)
        return node.value
    }
    
    public func set(_ key: KeyType, value: ValueType) {
        if let node = hashMap[key] {
            node.value = value
            return
        }
        let newNode = Node(value: value)
        priority.insert(newNode, at: 0)
        hashMap[key] = newNode
        
        while priority.count > capacity {
            guard let tailNode = priority.tail else {
                return
            }
            priority.remove(node: tailNode)
        }
    }
}
