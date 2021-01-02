//
//  PrintDebug.swift
//  LiveOnce
//
//  Created by Dzmitry Sotnikov on 28/06/2019.
//  Copyright © 2019 Dzmitry Sotnikov. All rights reserved.
//

import Foundation

var SHOW_DEBUG_MESSAGES = true
var MY_DEBUG_LINE_COUNT : Int64 = 1

func PRINT_DEBUG(_ printData : Any...) {
    #if DEBUG
        if SHOW_DEBUG_MESSAGES {
            print("MY_DEBUG \(MY_DEBUG_LINE_COUNT): ",printData)
        }
        MY_DEBUG_LINE_COUNT += 1
    #endif
}
