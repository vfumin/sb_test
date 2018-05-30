//: Playground - noun: a place where people can play

import UIKit

//тестовый прогон
var values = [1.5, 3, 6, 1.5]
var calculator = RateCalculator()
calculator.calculate(values: values)

//оценка времени
values.removeAll()
for i in 1...10000{
    values.append(Double(i))
}
let time = Date().timeIntervalSince1970
calculator.calculate(values: values)
let newTime = Date().timeIntervalSince1970 - time

