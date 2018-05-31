//
//  BondChartTypeView.swift
//  Task
//
//  Created by Fumin Vladimir on 31.05.2018.
//  Copyright © 2018 Fumin Vladimir. All rights reserved.
//

import Foundation
import UIKit
class BondValueButton: UIButton{
    init() {
        super.init(frame: CGRect.zero)
        self.setImage(#imageLiteral(resourceName: "ic_arrow_down"), for: .normal)
        setBondValue(value: .yield)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBondValue(value: BondValue){
        self.setTitle(value.rawValue.uppercased(), for: .normal)
    }
}
