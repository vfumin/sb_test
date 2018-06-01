//: Playground - noun: a place where people can play

import UIKit

//тестовый прогон
var values = [1.5, 3, 6, 1.5]
var calculator = RateCalculator()
let result = calculator.calculate(values: values).ratesStrings

public struct RateCalculator{
    public var sumValues = Double()
    public var rates = [Double]()
    public var values = [Double]()
    public var ratesStrings = [String]()
    
    public init(){
        
    }
    
    public mutating func calculate(values: [Double], presentationPrecision: Int = 3) -> RateCalculator {
        let nf = NumberFormatter()
        nf.maximumFractionDigits = presentationPrecision
        nf.minimumFractionDigits = presentationPrecision
        
        self.values = values
        sumValues = values.reduce(0, +)
        rates = values.map({
            $0 * 100 / sumValues
        })
        ratesStrings = rates.map({
            nf.string(from: NSNumber(value: $0))!
        })
        return self
    }
}

