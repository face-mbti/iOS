//
//  face_mbtiTests.swift
//  face-mbtiTests
//
//  Created by 현기엽 on 2021/04/07.
//

import XCTest
@testable import face_mbti
import Rswift

class face_mbtiTests: XCTestCase {
    func testRswiftValidate() throws {
        try R.validate()
    }
}
