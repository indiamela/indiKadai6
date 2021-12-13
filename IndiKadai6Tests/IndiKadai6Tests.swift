//
//  IndiKadai6Tests.swift
//  IndiKadai6Tests
//
//

import XCTest
@testable import IndiKadai6

class IndiKadai6Tests: XCTestCase {
    let gameRule = GameRule()

    func test_createdRandomInt_lessThan100() throws {
        let result = gameRule.createRandomValue()
        XCTAssertTrue((1...100).contains(result))
    }

    func test_judgeAnswere_incorrect() throws {
        XCTAssertEqual(try gameRule.judgeAnswer(subject: 10, answer: 50), false)
    }

    func test_judgeAnswere_correct() throws {
        XCTAssertEqual(try gameRule.judgeAnswer(subject: 10, answer: 10), true)
    }

    func test_judgeAnswere_error() throws {
        XCTAssertThrowsError(try gameRule.judgeAnswer(subject: 10, answer: 102))
    }
}
