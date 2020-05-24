import Foundation
import XCTest

func linearSearch(_ arr: [Int], for target: Int) -> Int? {
    for (i, val) in arr.enumerated() {
        if target == val {
            return i
        }
    }
    
    return nil
}

class Tests: XCTestCase {
    func testInArray() {
        let expected = 3
        let actual = linearSearch([1,2,3,4,5], for: 4)!
        
        XCTAssertEqual(expected, actual)
    }
    
    func testNotInArray() {
        let actual = linearSearch([1,2,3,4,5], for: 6)
        XCTAssertNil(actual)
    }
}

Tests.defaultTestSuite.run()
