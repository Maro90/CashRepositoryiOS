//
//  CashRegisterTests.swift
//  CashRegisterTests
//
//  Created by Mauro Gonzalez on 06/06/2020.
//  Copyright © 2020 Mauro Gonzalez. All rights reserved.
//

import XCTest

class CashRegisterTest: XCTestCase {

    var availableFunds: Decimal!
    var sut: CashRegister!
    var itemCost: Decimal!

    override public func setUp() {
        super.setUp()
        availableFunds = Decimal(100)
        sut = CashRegister(availableFunds: availableFunds)
        itemCost = Decimal(42)

    }
    
    override public func tearDown() {
        availableFunds = nil
        itemCost = nil
        sut = nil
        super.tearDown()
    }
    
    
    func testInit_createsCashRegister() {
        XCTAssertNotNil(CashRegister())
    }
    
    func testInitAvailableFunds_setAvailableFunds() {
        //Then
        XCTAssertEqual(availableFunds, sut.availableFunds)
    }


    func testAddItem_oneItem_addsCostToTransactionTotal() {
        //When
        sut.addItem(itemCost)

        //Then
        XCTAssertEqual(itemCost, sut.transactionTotal)
    }

    func testAddItem_twoItems_addsCostsToTransactionTotal() {
        //Given
        let itemCost2 = Decimal(42)
        let expectedTotal = itemCost + itemCost2

        //When
        sut.addItem(itemCost)
        sut.addItem(itemCost2)

        //Then
        XCTAssertEqual(expectedTotal, sut.transactionTotal)
    }
}
