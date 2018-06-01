//
//  BondChartPeriodView.swift
//  Task
//
//  Created by Fumin Vladimir on 31.05.2018.
//  Copyright © 2018 Fumin Vladimir. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
class BondChartPeriodView: UISegmentedControl{
    init() {
        super.init(frame: CGRect.zero)
        
        Period.allCases.forEach{
            self.insertSegment(withTitle: $0.rawValue, at: self.numberOfSegments, animated: false)
        }
        
        selectedSegmentIndex = 0
        backgroundColor = .clear
        tintColor = .clear
        
        setTitleTextAttributes([ NSAttributedStringKey.foregroundColor: UIColor.black
            ], for: .normal)
        
        setTitleTextAttributes([ NSAttributedStringKey.foregroundColor: UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1)
            ], for: .selected)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
