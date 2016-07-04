//
//  LineChartViewController.swift
//  swiftChartPods
//
//  Created by User on 29/06/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class LineChartViewController: UIViewController, LineChartDelegate {
    
    var lineChart: LineChart!
    var label = UILabel()
    var views: [String: AnyObject] = [:]
    
    private var labelLeadingMarginInitialConstant: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //      var views: [String: AnyObject] = [:]
        
        label.text = "Current Value"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.Center
        self.view.addSubview(label)
        views["label"] = label
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[label]-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-80-[label]", options: [], metrics: nil, views: views))
        
        //      var data: [CGFloat] = [50, 30, 50, 113, 317, 50, 24,]
        let data: [CGFloat] = [50, 30, 50, 113, 317, 50, 24, 30, 50]
        
        // simple line with custom x axis labels
        let xLabels: [String] = ["1'st","", "", "2th", "", "", "3th","","4th"]
        
        lineChart = LineChart()
        lineChart.animation.enabled = true
        lineChart.area = true
        //          lineChart.x.grid.visible = false
        //          lineChart.y.grid.visible = false
        lineChart.x.labels.visible = true
        lineChart.x.grid.count = CGFloat(data.count)
        lineChart.y.grid.count = CGFloat(xLabels.count)
        lineChart.x.labels.values = xLabels
        lineChart.y.labels.visible = true
        
        lineChart.dots.color = UIColor.blackColor()
        
        lineChart.addLine(data)
        //        lineChart.addLine(data2)
        
        lineChart.translatesAutoresizingMaskIntoConstraints = false
        lineChart.delegate = self
        self.view.addSubview(lineChart)
        views["chart"] = lineChart
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[chart]-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[label]-[chart(==200)]", options: [], metrics: nil, views: views))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




    func didSelectDataPoint(x: CGFloat, yValues: Array<CGFloat>) {
        label.text = "Value : \(yValues)"
    }



/**
 * Redraw chart on device rotation.
 */

    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        if let chart = lineChart {
            chart.setNeedsDisplay()
        }
    }
}
