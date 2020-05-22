import UIKit
import XCTest

//Queue Protocol
protocol Queue : Equatable{
    associatedtype Element
    
    var isEmpty: Bool{ get }
    
    mutating func enqueue(_ item: Element)
    mutating func dequeue() -> Element?
    func peek() -> Element?
    
    mutating func next() -> Element?
}

//Array backed queue - O(n)
struct ArrayQueue<Element: Equatable> : Queue {
    private var data: [Element] = []
    
    var isEmpty: Bool {
        return data.count == 0
    }
    
    //O(1)
    mutating func enqueue(_ item: Element) {
        data.append(item)
    }
    
    //O(n)
    mutating func dequeue() -> Element? {
        return isEmpty ? nil : data.removeFirst()
    }
    
    //O(1)
    func peek() -> Element? {
        return data.first
    }
    
    mutating func next() -> Element? {
        return dequeue()
    }
}

extension ArrayQueue: CustomStringConvertible {
    var description: String {
        get {
            return data
                    .map{ "\($0)" }
                    .joined(separator: " ")
        }
    }
}

extension ArrayQueue: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        data = elements
    }
}

class ArrayQueueTests: XCTestCase {
    var queue = ArrayQueue<Int>()
    
    override func setUp() {
        super.setUp()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
    }
    
    func testIsEmpty() {
        queue.dequeue()
        queue.dequeue()
        queue.dequeue()
        
        XCTAssertTrue(queue.isEmpty)
    }
    
    func testEnqueue() {
        queue.enqueue(4)
        XCTAssertEqual(queue.description, "1 2 3 4")
    }
    
    func testDequeue() {
        queue.dequeue()
        XCTAssertEqual(queue.description, "2 3")
    }
    
    func testPeek() {
        XCTAssertEqual(queue.peek(), 1)
    }
    
    func testArrayLiteral() {
        let newQueue: ArrayQueue = [1,2,3]
        XCTAssertEqual(queue, newQueue)
    }
}

ArrayQueueTests.defaultTestSuite.run()
