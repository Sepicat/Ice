//: Playground - noun: a place where people can play

import UIKit

// reference: https://github.com/raywenderlich/swift-algorithm-club/blob/master/Linked%20List/LinkedList.swift

var str = "LRU Algorithm"

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
        return nil
    }
}
