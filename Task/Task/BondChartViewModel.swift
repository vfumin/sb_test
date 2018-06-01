//
//  BondChartViewModel.swift
//  Task
//
//  Created by Fumin Vladimir on 31.05.2018.
//  Copyright © 2018 Fumin Vladimir. All rights reserved.
//

import Foundation
import RxSwift

class BondChartViewModel{
    let bondsData = Variable([Bond]())
    let bondValue = Variable(BondValue.yield)
    let period = Variable(Period.w)
    
    private var isin = ""
    
    func setPeriod(_ value: Period){
        guard period.value != value else{
            return
        }
        period.value = value
        internalLoadBonds()
    }
    
    func setBondValue(_ value: BondValue){
        guard bondValue.value != value else{
            return
        }
        bondValue.value = value
        internalLoadBonds()
    }
    
    func loadBonds(isin: String){
        self.isin = isin
        internalLoadBonds()
    }
    
    // MARK: private
    func internalLoadBonds(){
        let queue = DispatchQueue.global(qos: .utility)
        queue.async{
            self.bondsData.value = DataModel.shared.getBonds(isin: self.isin, valueType: self.bondValue.value, period: self.period.value)
        }
        
    }
    
}
