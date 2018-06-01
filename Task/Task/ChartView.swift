//
//  BondChartView.swift
//  Task
//
//  Created by Fumin Vladimir on 31.05.2018.
//  Copyright © 2018 Fumin Vladimir. All rights reserved.
//

import Foundation
import SciChart

class ChartView: UIView{
    private let surface1 = SCIChartSurface()
    private var dataSeries: SCIXyDataSeries = SCIXyDataSeries(xType: SCIDataType.dateTime, yType: SCIDataType.double)
    private var series = SCIFastLineRenderableSeries()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        completeConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        completeConfiguration()
    }
    
    override func layoutSubviews() {
        surface1.frame.size = CGSize(width: self.frame.width, height: self.frame.height)
    }
    
    func clearValues(){
        dataSeries.clear()
    }
    
    func appendData(_ data: Double, date: Date = Date()){
        dataSeries.appendX(SCIGeneric(date), y: SCIGeneric(data))
    }
    
    func invalidate(){
        surface1.invalidateElement()
    }
    
    // MARK: Private Functions
    private func completeConfiguration() {
        surface1.translatesAutoresizingMaskIntoConstraints = true
        
        let xAxis = SCIDateTimeAxis()
        let yAxis = SCINumericAxis()
        
        xAxis.autoRange = .always
        xAxis.axisId = "X1"
        xAxis.textFormatting = "dd.MM"
        surface1.xAxes.add(xAxis)
        
        yAxis.axisId = "Y1"
        yAxis.cursorTextFormatting = "%.02f"
        yAxis.growBy = SCIDoubleRange(min: SCIGeneric(0.1), max: SCIGeneric(0.1))
        yAxis.autoRange = .always
        surface1.yAxes.add(yAxis)
        addSubview(surface1)
        
        series.xAxisId = xAxis.axisId
        series.yAxisId = yAxis.axisId
        
        dataSeries.dataDistributionCalculator = SCIUserDefinedDistributionCalculator()
        series.dataSeries = dataSeries
        series.style.strokeStyle.thickness = 3
        surface1.
        surface1.renderableSeries.add(series)
        surface1.invalidateElement()
        SCIThemeManager.applyTheme(toThemeable: surface1, withThemeKey: "SciChart_Simple")
    }
    
}

