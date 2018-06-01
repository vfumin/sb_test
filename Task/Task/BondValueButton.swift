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
        
        backgroundColor = UIColor.white
        setTitleColor(.black, for: .normal)
        
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 4
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
    
    func setBondValue(value: BondValue){
        self.setTitle(value.rawValue.uppercased(), for: .normal)
    }
}
