//
//  SliderViewController.swift
//  swiftChartPods
//
//  Created by User on 29/06/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    weak var currentViewController: UIViewController?
    @IBOutlet weak var sliderOutlet: UISlider!
    var Value:Float = 0
    @IBOutlet weak var Slideview: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.currentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LineChartVC")  // LineChartVC (or) SwiftChartVC
        self.currentViewController!.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(self.currentViewController!)
        self.addSubview(self.currentViewController!.view, toView: self.containerView)
        
        let newViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LineChartVC")
        newViewController!.view.translatesAutoresizingMaskIntoConstraints = false
        self.cycleFromViewController(self.currentViewController!, toViewController: newViewController!)
        self.currentViewController = newViewController
      
    }
    
    override func viewWillAppear(animated: Bool) {
  //        self.containerView.frame = CGRectMake(-CGFloat(Value),186, 0 ,0 )
        
        Slideview.contentOffset = CGPoint(x:CGFloat(Value), y: 20)
        Slideview.addSubview(containerView)
        view.addSubview(Slideview)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cycleFromViewController(oldViewController: UIViewController, toViewController newViewController: UIViewController) {
        oldViewController.willMoveToParentViewController(nil)
        self.addChildViewController(newViewController)
        self.addSubview(newViewController.view, toView:self.containerView!)
        newViewController.view.alpha = 0
        newViewController.view.layoutIfNeeded()
        UIView.animateWithDuration(0.5, animations: {
            newViewController.view.alpha = 1
            oldViewController.view.alpha = 0
            },
                                   completion: { finished in
                                    oldViewController.view.removeFromSuperview()
                                    oldViewController.removeFromParentViewController()
                                    newViewController.didMoveToParentViewController(self)
        })
    }
    
    func addSubview(subView:UIView, toView parentView:UIView) {
        parentView.addSubview(subView)
        
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        parentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[subView]|",
            options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[subView]|",
            options: [], metrics: nil, views: viewBindingsDict))
    }


    @IBAction func SliderAction(sender: AnyObject) {
        
        self.Value = sliderOutlet.value
        print(Value)
        
      viewWillAppear(true)

     /*
        let rect = CGRectMake( CGFloat(value),10.s0, 600 ,100 )
        var DynamicView=UIView(frame: rect)
        DynamicView.backgroundColor=UIColor.greenColor()
        DynamicView.layer.cornerRadius=25
        DynamicView.layer.borderWidth=2
        self.view.addSubview(DynamicView)
      */
        
      /*   var bgImage: UIImageView?
         var image: UIImage = UIImage(named: "city.jpg")!
         bgImage = UIImageView(image: image)
         bgImage!.frame = CGRectMake(-CGFloat(value),0,1300,200)
         self.view.addSubview(bgImage!)
      */
        
    }


}
