//
//  BondChartView.swift
//  Task
//
//  Created by Fumin Vladimir on 31.05.2018.
//  Copyright © 2018 Fumin Vladimir. All rights reserved.
//

import Foundation
import SciChart
import RxCocoa
import RxSwift

class BondChartView: UIView{
    private let chart = ChartView()
    private let button = BondValueButton()
    private let periods = BondChartPeriodView()
    private let disposeBag = DisposeBag()
    private let viewModel = BondChartViewModel()
    var viewController: UIViewController? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(chart)
        addSubview(button)
        addSubview(periods)
        
        let margins = self.layoutMarginsGuide
        
        button.frame = CGRect(x: 40, y: 60, width: 120, height: 40)
        
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
        
        periods.rx.controlEvent(UIControlEvents.valueChanged).subscribe(onNext: { _ in
            let period = Period.allCases[self.periods.selectedSegmentIndex]
            self.viewModel.setPeriod(period)
        }).disposed(by: disposeBag)
        
        button.setBondValue(value: viewModel.bondValue.value)
        button.rx.tap.subscribe(onNext:{_ in
            self.selectBondValue()
        }).disposed(by: disposeBag)
        
        viewModel.bondValue.asObservable().subscribe(onNext: {bv in
            self.button.setBondValue(value: bv)
        }).disposed(by: disposeBag)
        viewModel.bondsData.asObservable().subscribe(onNext: {_ in
            self.loadChart()
        }).disposed(by: disposeBag)
    }
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadChart(isin: String){
        self.viewModel.loadBonds(isin: isin)
    }
    
    // MARK: private
    private func loadChart(){
        chart.clearValues()
        let items = viewModel.bondsData.value
        items.forEach({b in
            chart.appendData(Double(b.value), date: b.date)
        })
        chart.invalidate()
    }
    
    private var selectDisposer: Disposable? = nil
    private func selectBondValue(){
        let popover = BondValueTableViewController()
        let rows = CGFloat(BondValue.count);
        popover.preferredContentSize = CGSize(width: 150, height: 48 * rows)
        popover.modalPresentationStyle = .popover
        if let popoverController = popover.popoverPresentationController{
            popoverController.delegate = self
            popoverController.sourceView = self.button
            popoverController.sourceRect = self.button.bounds
        }
        viewController?.present(popover, animated: true, completion: nil)
        selectDisposer = popover.tableView.rx.modelSelected(BondValue.self).subscribe(onNext: {bv in
            self.selectDisposer?.dispose()
            self.viewModel.setBondValue(bv)
            popover.dismiss(animated: true, completion: {
                
            })
        })
    }
    
}

extension BondChartView: UIPopoverPresentationControllerDelegate{
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none;
    }
}

