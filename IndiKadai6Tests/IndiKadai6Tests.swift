//
//  IndiKadai6Tests.swift
//  IndiKadai6Tests
//
//

import XCTest
@testable import IndiKadai6

class IndiKadai6Tests: XCTestCase {
    let actions = Actions()

    func test_createdRandomInt_lessThan100() throws {
        let result = actions.createRandomInt()
        XCTAssertTrue((1...100).contains(result))
    }

    func test_judgeAnswere_incorrect() throws {
        let result = actions.judgeAnswere(subject: 10, answere: 50)
        XCTAssertEqual(result, "はずれ！あなたの値：50")
    }

    func test_judgeAnswere_correct() throws {
        let result = actions.judgeAnswere(subject: 10, answere: 10)
        XCTAssertEqual(result, "あたり！あなたの値：10")
    }

    func test_judgeAnswere_error() throws {
        let result = actions.judgeAnswere(subject: 10, answere: 102)
        XCTAssertEqual(result, "エラーが発生しました")
    }
}
