import Foundation
import XCTest

//Binary Search
//Assumes the array is already sorted
func binarySearch<Element: Comparable>(arr: [Element], target: Element) -> Int? {
    func _binarySearch(_ target: Element = target, leftSub: Int, rightSub: Int) -> Int? {
        guard arr.count > 0 else { return nil}
        if leftSub > rightSub { return nil }
        
        let mid = (leftSub + rightSub) / 2
        
        switch arr[mid] {
        case target:
            return mid
        case let val where val < target:
            return _binarySearch(leftSub: mid+1, rightSub: rightSub)
        case let val where val > target:
            return _binarySearch(leftSub: leftSub, rightSub: mid-1)
        default:
            return nil
        }
    }
    
    return _binarySearch(leftSub: 0, rightSub: arr.count)
}

class Tests: XCTestCase {
    func testEmpty() {
        let actual: Int? = binarySearch(arr: [], target: 6)
        
        XCTAssertNil(actual)
    }
    
    func testValueeInMid() {
        let expected = 2
        let actual: Int = binarySearch(arr: [1,2,3,4,5], target: 3)!
        
        XCTAssertEqual(expected, actual)
    }
    
    func testValueInLeftSub() {
        let expected = 1
        let actual: Int = binarySearch(arr: [1,2,3,4,5], target: 2)!
        
        XCTAssertEqual(expected, actual)
    }
    
    func testValueInRightSub() {
        let expected = 3
        let actual: Int = binarySearch(arr: [1,2,3,4,5], target: 4)!
        
        XCTAssertEqual(expected, actual)
    }
}

Tests.defaultTestSuite.run()
