import Foundation
import XCTest

func bubbleSort(arr: inout [Int]) {
    for i in 0..<arr.count {
        for j in 0..<arr.count-i-1 {
            if arr[j] > arr[j+1] {
                arr.swapAt(j, j+1)
            }
        }
    }
}

class Tests: XCTestCase {
    func testOne() {
        let expected = [11, 12, 22, 25, 34, 64, 90]
        var input = [64, 34, 25, 12, 22, 11, 90]
        bubbleSort(arr: &input)
        
        XCTAssertEqual(expected, input)
    }
}
Tests.defaultTestSuite.run()
