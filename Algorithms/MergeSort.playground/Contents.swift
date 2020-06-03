import Foundation
import XCTest

extension Array where Element: Comparable {
    mutating func mergeSort(by comparison: (Element, Element) -> Bool) {
        
        func internalMergeSort(_ arr: [Element]) -> [Element] {
            guard arr.count > 1 else { return arr}

            let mid = arr.count / 2
            var left = Array(arr[0..<mid])
            var right = Array(arr[mid..<arr.count])

            left = internalMergeSort(left)
            right = internalMergeSort(right)

            return merge(&left, &right, by: comparison)
        }

        self = internalMergeSort(self)
    }

    private func merge(_ left: inout [Element], _ right: inout [Element], by comparison: (Element, Element) -> Bool) -> [Element] {
        var mergedArray = [Element]()

        while left.count > 0 && right.count > 0 {
            if comparison(left.first!, right.first!) {
                mergedArray.append(left.removeFirst())
            } else {
                mergedArray.append(right.removeFirst())
            }
        }

        return mergedArray + left + right
    }
}

class Tests: XCTestCase {
    func testOne() {
        let expected = [11, 12, 22, 25, 34, 64, 90]
        var input = [64, 34, 25, 12, 22, 11, 90]
        input.mergeSort(by: < )
        
        XCTAssertEqual(expected, input)
    }
    
    func testTwo() {
        let expected = [90, 64, 34, 25, 22, 12, 11]
        var input = [64, 34, 25, 12, 22, 11, 90]
        input.mergeSort(by: > )
        
        XCTAssertEqual(expected, input)
    }
}
Tests.defaultTestSuite.run()
