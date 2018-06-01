//
//  Period.swift
//  Task
//
//  Created by Fumin Vladimir on 31.05.2018.
//  Copyright © 2018 Fumin Vladimir. All rights reserved.
//

import Foundation
enum Period: String, AutoCases{
    case w = "1W"
    case m = "1M"
    case m3 = "3M"
    case m6 = "6M"
    case y = "1Y"
    case y2 = "2Y"
    
    var days: Int {
        let daysInMonth = 31
        switch self {
        case .w:
            return 7
        case .m:
            return daysInMonth
        case .m3:
            return daysInMonth * 3
        case .m6:
            return daysInMonth * 6
        case .y:
            return 365
        case .y2:
            return 365 * 2
        }
    }
}
