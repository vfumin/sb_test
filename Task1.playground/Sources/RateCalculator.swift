import Foundation

public struct RateCalculator{
    var sumValues = Double()
    var rates = [Double]()
    var values = [Double]()
    var ratesStrings = [String]()
    
    public init(){
        
    }
    
    public mutating func calculate(values: [Double], presentationPrecision: Int = 3) {
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
    }
}
