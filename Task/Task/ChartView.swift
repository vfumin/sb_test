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
    private var timeoutTime:Date = Date()
    var appendTimeout: TimeInterval = 0
    
    private let surface1 = SCIChartSurface()
    
    var xAxis = SCIDateTimeAxis()
    var yAxis = SCINumericAxis()
    
    private var askDataSeries: SCIXyDataSeries = SCIXyDataSeries(xType: SCIDataType.dateTime, yType: SCIDataType.double)
    private var seriesAsk = SCIFastLineRenderableSeries()
    private var box: SCIBoxAnnotation!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.green
        completeConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        completeConfiguration()
    }
    
    func configureChartSurfaces() {
        surface1.translatesAutoresizingMaskIntoConstraints = true
        
        xAxis.autoRange = .always
        xAxis.axisId = "X1"
        xAxis.textFormatting = "HH:mm"
        surface1.xAxes.add(xAxis)
        
        yAxis.axisId = "Y1"
        yAxis.cursorTextFormatting = "%.02f"
        yAxis.growBy = SCIDoubleRange(min: SCIGeneric(0.1), max: SCIGeneric(0.1))
        yAxis.autoRange = .always
        surface1.yAxes.add(yAxis)
    }
    
    private func initMarkerLine(_ markerLine: SCIHorizontalLineAnnotation, color: UIColor, title: String){
        markerLine.yAxisId = self.yAxis.axisId
        markerLine.coordinateMode = .absolute
        
        //        markerLine.add(self.buildLineTextLabel(title, alignment: SCILabelPlacement.topLeft, backColor: color, textColor: UIColor.white))
        let style = SCISolidPenStyle.init(color: color, withThickness:0.5)
        markerLine.style.linePen = style
        
        surface1.annotations.add(markerLine)
    }
    
    override func layoutSubviews() {
        surface1.frame.size = CGSize(width: self.frame.width, height: self.frame.height)
    }
    
    func clearValues(){
        askDataSeries.clear()
    }
    
    func appendData(_ data: Double, date: Date = Date(), invalidate: Bool = false){
        if appendTimeout == 0 || ((Date().timeIntervalSince1970 - timeoutTime.timeIntervalSince1970) > appendTimeout) {
            timeoutTime = Date()
            askDataSeries.appendX(SCIGeneric(date), y: SCIGeneric(data))
            if invalidate {
                surface1.invalidateElement()
            }
        }
    }
    
    // MARK: Private Functions
    private func completeConfiguration() {
        SCIThemeManager.applyTheme(toThemeable: surface1, withThemeKey: "SciChart_Simple")
        //  Initializing top scichart view
        configureChartSurfaces()
        addSubview(surface1)
        
        initSeries(seriesAsk)
        
        //  Initializing box annotation
        box = SCIBoxAnnotation()
        box.xAxisId = "X2"
        box.yAxisId = "Y2"
        box.coordinateMode = .relativeY
        box.style.fillBrush = SCISolidBrushStyle(colorCode: 0x200070FF)
        
        askDataSeries.dataDistributionCalculator = SCIUserDefinedDistributionCalculator()
        seriesAsk.dataSeries = askDataSeries
        surface1.renderableSeries.add(seriesAsk)
        surface1.invalidateElement()
    }
    
    private func initSeries(_ series: SCIFastLineRenderableSeries) {
        series.xAxisId = xAxis.axisId
        series.yAxisId = yAxis.axisId
    }
    
    
}

