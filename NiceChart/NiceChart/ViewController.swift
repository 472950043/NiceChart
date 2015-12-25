//
//  ViewController.swift
//  NiceChart
//
//  Created by jyb on 15/12/25.
//  Copyright © 2015年 jyb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var 选择: UISegmentedControl!
    @IBOutlet var chartView: UIView!
    var chart: ChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //作者QQ472950043
        chart = ChartView.instanceChartView()
        chart.frame = chartView.bounds
        chartView.addSubview(chart)
        loadNewData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func 切换图表(sender: AnyObject) {
        reloadData()
    }
    
    func loadNewData(){
        self.performSelector("reloadData", withObject: self, afterDelay: 1)
    }
    
    func reloadData(){
        if(选择.selectedSegmentIndex == 0){
            chart.纵坐标数据 = [0,30,60,78,50,60,10]
            chart.横坐标数据 = ["10月28","29","30","31","11月1","2","今日"]
            chart.backgroundColor = UIColor(red: 1, green: 187.0/255, blue: 0, alpha: 1)
        } else {
            chart.纵坐标数据 = [80,30,60,78,50,60]
            chart.横坐标数据 = ["11月8","9","10","11","12","今日"]
            chart.backgroundColor = UIColor(red: 0, green: 124.0/255, blue: 207.0/255, alpha: 1)
        }
        chart.显示图表()
    }

}

