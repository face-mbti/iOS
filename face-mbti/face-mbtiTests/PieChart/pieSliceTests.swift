//
//  pieSliceTests.swift
//  face-mbtiTests
//
//  Created by 현기엽 on 2021/04/26.
//

import XCTest
@testable import face_mbti

class pieSliceTests: XCTestCase {
    func testPieSlices() {
        _ = PieSlices(data: [])
    }

    func testPieSlicesFirstStartDegreeEqual0() {
        let data = [4, 2, 0.13]
        let pieSlices = PieSlices(data: data)
        XCTAssertEqual(pieSlices.values.first?.startAngle.degrees, 0.0)
    }

    func testPieSlicesLastEndDegreeEqual360() {
        let data = [4, 2, 0.13]
        let pieSlices = PieSlices(data: data)
        XCTAssertEqual(pieSlices.values.last?.endAngle.degrees, 360.0)
    }
}
