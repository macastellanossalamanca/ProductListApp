//
//  LogTypeExtension.swift
//  ProductListApp
//
//  Created by Miguel Castellanos on 13/05/24.
//

import os.log
import Foundation

extension OSLog {
    private static var subsystem = Bundle.main.bundleIdentifier!
    
    static let navigation = OSLog(subsystem: subsystem, category: "navigation")
    static let businessLogic = OSLog(subsystem: subsystem, category: "businessLogic")
    static let view = OSLog(subsystem: subsystem, category: "view")
    static let network = OSLog(subsystem: subsystem, category: "network")
}
