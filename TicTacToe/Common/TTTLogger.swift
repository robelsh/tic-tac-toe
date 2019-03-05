//
//  TTTLogger.swift
//  TicTacToe
//
//  Created by Etienne Jézéquel on 3/5/19
//  Copyright (c) 2019 Etienne. All rights reserved.
//
import Foundation
import SwiftyBeaver

// Create global variable for logs
let logger =  SwiftyBeaver.self

struct TTTLogger {
  static func setup() {
    let console = ConsoleDestination()
    
    console.format = "$D[HH:mm:ss]$d $L - $N.$F:$l > $M"
    console.levelString.verbose = "📔 -- VERBOSE"
    console.levelString.debug = "📗 -- DEBUG"
    console.levelString.info = "📘 -- INFO"
    console.levelString.warning = "📙 -- WARNING"
    console.levelString.error = "📕 -- ERROR"
    
    logger.addDestination(console)
  }
}
