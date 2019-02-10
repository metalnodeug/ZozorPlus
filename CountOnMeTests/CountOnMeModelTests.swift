//
//  CountOnMeTests.swift
//  CountOnMeTests
//
//  Created by metalnodeug on 10/02/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CountOnMeTests: XCTestCase {
    let calculate = Calculate()

    func testGivenStartApplication_WhenUserDontTouchAnything_ThenStringNumbersContainsNoValueAndOperatorsContainsPlus() {
        XCTAssertEqual(calculate.stringNumbers, [""])
        XCTAssertEqual(calculate.operators, ["+"])
        XCTAssertFalse(calculate.canAddOperator)
    }

    func testGivenInitCalculator_WhenUserTouchTwoAndPlusOperatorAndEight_ThenResultIsTen() {
        XCTAssertFalse(calculate.isExpressionCorrect)
        calculate.addNewNumber("2")
        try! calculate.addNewOperator("+")
        calculate.addNewNumber("8")
        XCTAssertTrue(calculate.isExpressionCorrect)

        XCTAssert(calculate.calculateTotal() == "10")
    }

    func testGivenInitCalculator_WhenUserTouchEigtAndMinusOperatorAndTwo_ThenResultIsSix() {
        XCTAssertFalse(calculate.isExpressionCorrect)
        calculate.addNewNumber("8")
        try! calculate.addNewOperator("-")
        calculate.addNewNumber("2")
        XCTAssertTrue(calculate.isExpressionCorrect)

        XCTAssert(calculate.calculateTotal() == "6")
    }

    func testGivenInitCalculator_WhenUserTouchTwoAndMultiplyOperatorAndEight_ThenResultIsSixteen() {
        XCTAssertFalse(calculate.isExpressionCorrect)
        calculate.addNewNumber("2")
        try! calculate.addNewOperator("x")
        calculate.addNewNumber("8")
        XCTAssertTrue(calculate.isExpressionCorrect)

        XCTAssert(calculate.calculateTotal() == "16")
    }

    func testGivenInitCalculator_WhenUserTouchEightAndDivideOperatorAndTwo_ThenResultIsFour() {
        XCTAssertFalse(calculate.isExpressionCorrect)
        calculate.addNewNumber("8")
        try! calculate.addNewOperator("/")
        calculate.addNewNumber("2")
        XCTAssertTrue(calculate.isExpressionCorrect)

        XCTAssert(calculate.calculateTotal() == "4")
    }

    func testGivenInitCalculator_WhenUserTouchAC_ThenResultClearValue() {
        calculate.clear()
        XCTAssert(calculate.operators == ["+"])
        XCTAssert(calculate.index == 0)
        XCTAssertEqual(calculate.stringNumbers, [""])
    }

    func testGivenUserWillAddDecimal_WhenUserTouchOneDotFivePlusFour_ThenResultIsFiveDotFive() {
        calculate.addNewNumber("1")
        calculate.addNewNumber(".")
        calculate.addNewNumber("5")
        XCTAssertFalse(calculate.canAddDecimal)
        XCTAssertTrue(calculate.canAddOperator)
        try! calculate.addNewOperator("+")
        XCTAssertFalse(calculate.canAddOperator)
        calculate.addNewNumber("4")
        XCTAssertTrue(calculate.canAddDecimal)

        XCTAssert(calculate.calculateTotal() == "5.5")
    }

    func testGivenInitCalculator_WhenTestingASwitchBreak_ThenResultIsNil() {
        XCTAssert(calculate.calculateTotal() == "Expression incorrecte")
        try? calculate.addNewOperator("")
    }
}
