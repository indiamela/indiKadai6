//
//  IndiKadai6Tests.swift
//  IndiKadai6Tests
//
//

import XCTest
@testable import IndiKadai6

class IndiKadai6Tests: XCTestCase {
    let gameRule = GameRule()

    func test_createRandomValue_lessThan100() throws {
        let result = gameRule.createRandomValue()
        XCTAssertTrue((1...100).contains(result))
    }

    func test_judgeAnswere_incorrect() throws {
        XCTAssertEqual(try gameRule.judgeAnswere(subject: 10, answere: 50), false)
    }

    func test_judgeAnswere_correct() throws {
        XCTAssertEqual(try gameRule.judgeAnswere(subject: 50, answere: 50), true)
    }

    func test_judgeAnswere_error() throws {
        XCTAssertThrowsError(try gameRule.judgeAnswere(subject: 10, answere: 102))
    }
}
