import Foundation
import XCTest

extension Array {
    func isSorted(in comparison: (Element,Element) -> Bool) -> Bool{
        for i in 1..<self.count {
            if !comparison(self[i - 1], self[i]){
                return false
            }
        }
        
        return true
    }
    
    mutating func bogosort(by comparison: (Element,Element) -> Bool) {
        while !self.isSorted(in: comparison ) {
            self.shuffle()
        }
    }
}

class Tests: XCTestCase {
    func testOne() {
        var input = [2,1]
        input.bogosort(by: < )
        let expected = [1,2]
        
        XCTAssertEqual(input, expected)
    }
    
    func testTwo() {
        var input = [1, 2]
        input.bogosort(by: > )
        let expected = [2,1]
        
        XCTAssertEqual(input, expected)
    }
}
Tests.defaultTestSuite.run()
