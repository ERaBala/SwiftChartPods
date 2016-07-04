//
//  ViewController.swift
//  swiftChartPods
//
//  Created by User on 24/06/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var newArray: Array<String> = ["Only Chart","Slider And Chart"]
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.dataSource = self
        self.tableview.delegate = self
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = self.newArray[indexPath.row]
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("ChartViewController") as! ChartViewController
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("SliderViewController") as! SliderViewController
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("SlideIntractionViewController") as! SlideIntractionViewController
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "BasicChartSegue" {
            let indexPath = tableview.indexPathForSelectedRow
            let dvc = segue.destinationViewController as! ChartViewController
//            dvc.selectedChart = indexPath!.row
        }
    }

}

