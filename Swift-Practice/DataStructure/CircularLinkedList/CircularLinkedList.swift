//
//  CircularLinkedList.swift
//  Swift-Practice
//
//  Created by Yune gim on 2024/03/25.
//
///헤드의 이전 노드가 테일, 테일의 다음 노드가 헤드를 가리키는 링크드 리스트
class CircularLinkedList<T>{
    fileprivate var head: DoublyNode<T>?
    fileprivate weak var tail: DoublyNode<T>?
    deinit {
        var currentNode = self.head
        while(currentNode != nil){
            currentNode?.nextNode = nil
            currentNode = currentNode?.prevNode
        }
    }
    ///리스트의 처음에 노드 추가
    func inertAtFirst(_ newNode: DoublyNode<T>){
        if self.head == nil{
            self.head = newNode
            self.tail = newNode
            return
        }

        self.head?.prevNode = newNode
        self.tail?.nextNode = self.head?.prevNode
        newNode.prevNode = self.tail
        newNode.nextNode = self.head
        self.head = newNode

    }
    //리스트의 특정 위치에 노드 삽입
    @discardableResult
    func insertAt(_ idx: Int, _ newNode: DoublyNode<T>)->DoublyNode<T>?{
        if self.head == nil {return nil}
        
        var currentNode = self.head
        for _ in 0..<idx{
            if currentNode == nil {return nil}
            currentNode = currentNode?.nextNode
        }
        
        currentNode?.prevNode?.nextNode = newNode
        currentNode?.prevNode = currentNode?.prevNode?.nextNode

        newNode.prevNode = currentNode?.prevNode
        newNode.nextNode = currentNode
        
        return newNode
    }
    ///리스트의 마지막에 노드 추가
    func insertAtLast(_ newNode: DoublyNode<T>){
        if self.head == nil {
            self.head = newNode
            self.tail = newNode
//            head?.prevNode = newNode
//            tail?.nextNode = newNode
            return
        }
        newNode.prevNode = self.tail //prevNode는 weak라 rf 증가 안한다
        newNode.nextNode = self.tail?.nextNode //rf 1 증가, newNode.nextNode = self.head시 head에 대한 rf가 증가함
        self.tail!.nextNode = newNode //새 노드의 rf 1 증가
        self.tail = newNode //tail은 weak라 rf 증가 안한다
    }
    ///리스트의 처음 노드를 삭제
    @discardableResult
    func removeFirst()->DoublyNode<T>?{
        if self.head == nil{
            return nil
        }
        var removeNode = self.head
        self.head = self.head?.nextNode
        self.head?.prevNode = self.tail
        self.tail?.nextNode = self.head
        return removeNode
    }
    ///리스트의 특정 위치 노드를 삭제
    @discardableResult
    func removeAt(_ idx: Int)->DoublyNode<T>?{
        if self.head == nil {return nil}
        var removeNode = self.head
        for _ in 0..<idx{
            if removeNode?.nextNode == nil {return nil}
            removeNode = removeNode?.nextNode
        }
        removeNode?.nextNode?.prevNode = removeNode?.prevNode
        removeNode?.prevNode?.nextNode = removeNode?.nextNode
        return removeNode
    }
    ///리스트내 특정 위치의 노드 반환
    @discardableResult
    func getNodeAt(_ idx: Int) -> DoublyNode<T>?{
        if self.head == nil { return nil}
        var currentNode = self.head
        for _ in 0..<idx{
            if currentNode == nil {return nil}
            currentNode = currentNode?.nextNode
        }
        return currentNode
    }
    ///리스트 내의 노드 수를 반환
    func getNodeCount()->Int{
        if self.head == nil {return 0}
        var count = 0
        var currentNode = self.head
        while(currentNode != nil){
            print("\(currentNode!.data!)",terminator: "")
            count += 1
            currentNode = currentNode?.nextNode
            if(currentNode === self.head) { break}
            if currentNode != nil { print(" -> ",terminator: "")}
        }
        print()
        return count
    }
    ///리스트 내의 노드를 역순으로 각 노드의 데이터를 출력
    func printReverse(){
        if self.head == nil{
            print("\(type(of: self)) is empty")
        }
        var currentNode = self.tail
        while currentNode != nil{
            print("\(currentNode?.data)",terminator: " ")
            if currentNode === self.head { break }
            if currentNode?.prevNode != nil{
                print("->", terminator: " ")
            }
            currentNode = currentNode?.prevNode
        }
    }
}
