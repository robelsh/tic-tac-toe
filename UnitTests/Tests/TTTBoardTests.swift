//
//  TTTBoardTests.swift
//  UnitTests
//
//  Created by Etienne Jézéquel on 05/03/2019.
//  Copyright © 2019 Etienne. All rights reserved.
//

import XCTest

class TTTBoardTests: XCTestCase {
    private var viewModel = TTBoardViewModel()
    
    override func setUp() {
        // This method is called before the invocation of each test method in the class.
        viewModel = TTBoardViewModel()
    }

    override func tearDown() {
        // This method is called after the invocation of each test method in the class.
    }

    func testDidPlayAppend() {
        viewModel.didPlay(at: 1)
        XCTAssert(viewModel.getBoard(of: .first).contains(1))
    }
    
    func testDidPlayNextTurn() {
        viewModel.didPlay(at: 1)
        XCTAssert(viewModel.getCurrentPlayer() == .second)
    }
    
    func testDidPlayNextTurn2() {
        viewModel.didPlay(at: 1)
        viewModel.didPlay(at: 3)
        XCTAssert(viewModel.getCurrentPlayer() == .first)
    }
    
    func testDidPlayWin() {
        viewModel.didPlay(at: 1)
        viewModel.didPlay(at: 4)
        viewModel.didPlay(at: 2)
        viewModel.didPlay(at: 5)
        viewModel.didPlay(at: 3)
        XCTAssert(viewModel.getState() == .win)
    }
    
    func testDidPlayDraw() {
        viewModel.didPlay(at: 1)
        viewModel.didPlay(at: 2)
        viewModel.didPlay(at: 5)
        viewModel.didPlay(at: 3)
        viewModel.didPlay(at: 6)
        viewModel.didPlay(at: 4)
        viewModel.didPlay(at: 7)
        viewModel.didPlay(at: 9)
        viewModel.didPlay(at: 8)
        XCTAssert(viewModel.getState() == .draw)
    }
}
