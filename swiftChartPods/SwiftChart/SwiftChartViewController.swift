//
//  SwiftChartViewController.swift
//  swiftChartPods
//
//  Created by User on 29/06/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit
import SwiftChart

class SwiftChartViewController: UIViewController,ChartDelegate {

    @IBOutlet weak var labelLeadingMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var chart: Chart!
    var selectedChart = 0
    
      private var labelLeadingMarginInitialConstant: CGFloat!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        chart.delegate = self
        
        switch selectedChart
        {
        case 0:
            // Simple chart
            let series = ChartSeries([100, 300, 500, 1130, 3170, 50, 24, 3170])
            series.color = ChartColors.blueColor()
            chart.addSeries(series)
            
        default: break;
        }
    }
    
    
/*    func didTouchChart(chart: Chart, indexes: Array<Int?>, x: Float, left: CGFloat) {
        for (seriesIndex, dataIndex) in indexes.enumerate() {
            if let value = chart.valueForSeries(seriesIndex, atIndex: dataIndex) {
                print("Touched series: \(seriesIndex): data index: \(dataIndex!); series value: \(value); x-axis value: \(x) (from left: \(left))")
            }
        }
    }
    
    func didFinishTouchingChart(chart: Chart) {
        
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        // Redraw chart on rotation
        chart.setNeedsDisplay()
        
    }*/
    
    // Chart delegate
    
    func didTouchChart(chart: Chart, indexes: Array<Int?>, x: Float, left: CGFloat) {
        
        if let value = chart.valueForSeries(0, atIndex: indexes[0]) {
            
            let numberFormatter = NSNumberFormatter()
            numberFormatter.minimumFractionDigits = 2
            numberFormatter.maximumFractionDigits = 2
            label.text = numberFormatter.stringFromNumber(value)!
            
            // Align the label to the touch left position, centered
            var constant = labelLeadingMarginInitialConstant + left - (label.frame.width / 2)
            
            // Avoid placing the label on the left of the chart
            if constant < labelLeadingMarginInitialConstant {
                constant = labelLeadingMarginInitialConstant
            }
            
            // Avoid placing the label on the right of the chart
            let rightMargin = chart.frame.width - label.frame.width
            if constant > rightMargin {
                constant = rightMargin
            }
            
            labelLeadingMarginConstraint.constant = constant
            
        }
        
    }
    
    func didFinishTouchingChart(chart: Chart) {
        label.text = ""
        labelLeadingMarginConstraint.constant = labelLeadingMarginInitialConstant
    }
    
    
    func getStockValues() -> Array<Dictionary<String, Any>> {
        
        // Read the JSON file
        let filePath = NSBundle.mainBundle().pathForResource("AAPL", ofType: "json")!
        let jsonData = NSData(contentsOfFile: filePath)
        let json: NSDictionary = (try! NSJSONSerialization.JSONObjectWithData(jsonData!, options: [])) as! NSDictionary
        let jsonValues = json["quotes"] as! Array<NSDictionary>
        
        // Parse data
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let values = jsonValues.map { (value: NSDictionary) -> Dictionary<String, Any> in
            let date = dateFormatter.dateFromString(value["date"]! as! String)
            let close = (value["close"]! as! NSNumber).floatValue
            return ["date": date!, "close": close]
        }
        
        return values
        
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        // Redraw chart on rotation
        chart.setNeedsDisplay()
        
    }
}


