//
//  ViewController.swift
//  Task
//
//  Created by Fumin Vladimir on 30.05.2018.
//  Copyright © 2018 Fumin Vladimir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let bondChart = BondChartView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bondChart.frame = view.bounds
        bondChart.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        bondChart.viewController = self
        self.view.addSubview(bondChart)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        bondChart.loadChart(isin: "Test")
    }

}

