//
//  BondChartView.swift
//  Task
//
//  Created by Fumin Vladimir on 31.05.2018.
//  Copyright © 2018 Fumin Vladimir. All rights reserved.
//

import Foundation
import SciChart

class BondChartView: UIView{
    private let chart = ChartView()
    private let button = BondValueButton()
    private let periods = BondChartPeriodView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(chart)
        addSubview(button)
        addSubview(periods)
        
        let margins = self.layoutMarginsGuide
        
        let offset: CGFloat = 40
        button.frame = CGRect(x: offset, y: offset, width: 100, height: 30)
        
        periods.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        periods.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        periods.topAnchor.constraint(equalTo: margins.bottomAnchor, constant: -40).isActive = true
        periods.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        periods.translatesAutoresizingMaskIntoConstraints = false
        
        chart.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        chart.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        chart.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        chart.bottomAnchor.constraint(equalTo: periods.topAnchor).isActive = true
        chart.translatesAutoresizingMaskIntoConstraints = false
    }
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

