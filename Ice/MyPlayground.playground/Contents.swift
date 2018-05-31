//: Playground - noun: a place where people can play

import UIKit

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


    /// The head of the Linked List
    private(set) var head: Node?

    /// The tail of the Linked List
    public var tail: Node? {
        guard var node = head else {
            return nil
        }
        while let next = node.next {
            node = next
        }
        return node
    }
}
