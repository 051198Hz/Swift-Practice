//
//  File.swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/03/20.
//
///다음 노드에 대한 포인터를 1가지 가지고 있는 노드
class Node<T>{
    var data:T?
    var nextNode:Node<T>?
    init(data: T? = nil, nextNode: Node<T>? = nil) {
        self.data = data
        self.nextNode = nextNode
    }
    deinit{
        
    }
}
///이전 노드, 이후 노드의 포인터를 1가지 가지고 있는 노드
class DoublyNode<T>{
    var prevNode: DoublyNode<T>?
    var nextNode: DoublyNode<T>?
    var data: T?
    init(prevNode: DoublyNode<T>? = nil, nextNode: DoublyNode<T>? = nil, data: T? = nil) {
        self.prevNode = prevNode
    }
}
