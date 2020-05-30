import Foundation
import XCTest

func insertionSort(on arr: inout[Int]) {
    for i in 1..<arr.count {
        let currVal = arr[i]
        var currIndex = i
        while currIndex > 0 && arr[currIndex-1] > currVal {
            arr.swapAt(currIndex, currIndex-1)
            currIndex -= 1
        }
    }
}

class Tests: XCTestCase {
    func testOne() {
        var input = [14, 33, 27, 10, 35, 19, 42, 44]
        let expected = [10, 14, 19, 27, 33, 35, 42, 44]
        insertionSort(on: &input)
        
        XCTAssertEqual(input, expected)
    }
}
Tests.defaultTestSuite.run()
