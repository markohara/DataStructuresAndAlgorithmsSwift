import Foundation
import XCTest

struct Stack<Element: Equatable> : Equatable {
    private var data: [Element] = []
    
    var isEmpty: Bool {
        return data.count == 0
    }
    
    //O(1)
    mutating func push(_ item: Element) {
        data.append(item)
    }
    
    //O(1)
    mutating func pop() -> Element? {
        return data.popLast()
    }
    
    //(1)
    mutating func peek() -> Element? {
        return data.last
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        get{
            return data.map{"\($0)"}.joined(separator: " ")
        }
    }
}

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        data = elements
    }
}

class Tests: XCTestCase {
    var stack = Stack<Int>()

    override func setUp() {
        super.setUp()
        
        stack.push(1)
        stack.push(2)
        stack.push(3)
    }
    
    func testIsEmpty() {
        stack.pop()
        stack.pop()
        stack.pop()
        XCTAssertTrue(stack.isEmpty)
    }
    
    func testPush() {
        stack.push(4)
        XCTAssertEqual(stack.description, "1 2 3 4")
    }
    
    func testPop() {
        XCTAssertEqual(stack.pop(), 3)
    }
    
    func testPeek() {
        XCTAssertEqual(stack.peek(), 3)
    }
    
    func testArrayLiteral() {
        let newStack: Stack = [1, 2, 3]
        XCTAssertEqual(stack, newStack)
    }
}

Tests.defaultTestSuite.run()
