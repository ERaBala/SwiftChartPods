//
//  SlideIntractionViewController.swift
//  swiftChartPods
//
//  Created by User on 30/06/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class SlideIntractionViewController: UIViewController {

    @IBOutlet weak var sliderView: UISlider!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var ViewOutlet: UIView!
    var Value:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.s
    }
    /*
     
     
     func sliderAction(sender: AnyObject) {
     var slider: UISlider = (sender as! UISlider)
     ScrollView.contentOffset = CGPointMake(0, slider.value())
     }
     
     func scrollViewDidScroll(scrollView: UIScrollView) {
     slider.value = scrollView.contentOffset.y
     }
     
     */
    @IBAction func SliderInteraction(sender: AnyObject) {
        
        self.Value = sliderView.value
        print(Value)
        
        self.scrollView.frame = CGRectMake(-CGFloat(Value),186, 0 ,0 )
        self.ViewOutlet.frame = CGRectMake(-CGFloat(Value),186, 0 ,0 )
        
        scrollView.contentOffset = CGPointMake(-CGFloat(Value),186)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
    }
    
}
