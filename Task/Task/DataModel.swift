//
//  DataModel.swift
//  Task
//
//  Created by Fumin Vladimir on 01.06.2018.
//  Copyright © 2018 Fumin Vladimir. All rights reserved.
//

import Foundation
class DataModel{
    static let shared = DataModel()
    
    private init(){
    }
    
    func getBonds(isin: String, valueType: BondValue, period: Period)->[Bond]{
        var result = [Bond]()
        let days = period.days
        let secondsInDay = 24 * 3600
        let ti = TimeInterval(days * secondsInDay)
        var date = Date(timeIntervalSinceNow: -ti)
        let now = Date()
        while date < now {
            result.append(Bond(date: date, value: getRandomValue(valueType)))
            date = date.addingTimeInterval(TimeInterval(secondsInDay))
        }
        return result
    }
    
    private func getRandomValue(_ valueType: BondValue) -> Float{
        switch valueType {
        case .price:
            return Float(arc4random_uniform(1000)) / 5
        case .yield:
            return Float(arc4random_uniform(200)) / 100 - 1
        }
    }
}
