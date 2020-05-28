import Foundation
import XCTest

func selectionSort(on arr: inout [Int]) {
    guard arr.count > 1 else { return }
    
    for i in 0..<arr.count {
        
        var low = i
        for k in i+1..<arr.count {
            if arr[low] > arr[k] {
                low = k
            }
        }
        
        if low != i {
            arr.swapAt(i, low)
        }
    }
}

class Tests: XCTestCase {
    func testOne() {
        let expected = [11, 12, 22, 25, 34, 64, 90]
        var input = [64, 34, 25, 12, 22, 11, 90]
        selectionSort(on: &input)
        
        XCTAssertEqual(expected, input)
    }
}
Tests.defaultTestSuite.run()
