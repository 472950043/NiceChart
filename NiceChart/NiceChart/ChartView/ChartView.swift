//
//  ChartView.swift
//  NiceChart
//
//  Created by jyb on 15/12/25.
//  Copyright © 2015年 tzrl. All rights reserved.
//

import UIKit

class ChartView: UIView {

    @IBOutlet var 标题: UILabel!
    @IBOutlet var 总计: UILabel!
    @IBOutlet var chartLine1View: UIView!
    @IBOutlet var chartLine1Height: NSLayoutConstraint!
    @IBOutlet var 图表Bg: ChartBg!
    @IBOutlet var 图表: Chart!
    @IBOutlet var 最大值: UILabel!
    @IBOutlet var 虚线: DottedLine!
    @IBOutlet var 虚线Height: NSLayoutConstraint!
    @IBOutlet var chartLine2View: UIView!
    @IBOutlet var chartLine2Height: NSLayoutConstraint!
    @IBOutlet var 横坐标view: UIView!
    
    var 纵坐标数据 = [0,30,60,78,50,60,10]
    var 横坐标数据 = ["10月28","29","30","31","11月1","2","今日"]
    var 坐标点 = [CGPoint]()
    
    var 上下线颜色 = UIColor(white: 1, alpha: 0.5)
    var 线颜色 = UIColor.whiteColor()
    var 虚线颜色 = UIColor(white: 1, alpha: 0.8)
    var 线宽度: CGFloat = 0.5
    var 上边距: CGFloat = 40
    var 点半径: CGFloat = 4
    
    class func instanceChartView() -> ChartView{
        return NSBundle.mainBundle().loadNibNamed("ChartView", owner: nil, options: nil).first as! ChartView
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        初始化图表()
    }
    
    func 初始化图表(){
        self.hidden = true
        self.layer.cornerRadius = 15
        chartLine1Height.constant = 线宽度
        chartLine2Height.constant = 线宽度
        虚线Height.constant = 线宽度
        
        chartLine1View.backgroundColor = 上下线颜色
        图表.线颜色 = 线颜色
        虚线.虚线颜色 = 线颜色
        chartLine2View.backgroundColor = 上下线颜色
        
        图表Bg.上边距 = 上边距
        图表.上边距 = 上边距
        
        图表.点半径 = 点半径
        
        图表Bg.backgroundColor = UIColor.clearColor()
        图表.backgroundColor = UIColor.clearColor()
        虚线.backgroundColor = UIColor.clearColor()
        
        叠加图标渐变效果()
    }
    
    func 叠加图标渐变效果(){
        // 创建出CAGradientLayer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = 图表.bounds
        gradientLayer.colors = [上下线颜色.CGColor, UIColor.clearColor().CGColor]
        gradientLayer.locations = [上边距 / 140, 1]
        
        gradientLayer.startPoint = CGPointMake(0, 0)
        gradientLayer.endPoint = CGPointMake(0, 1)
        
        // 容器view --> 用于加载创建出的CAGradientLayer
        let containerView = UIView(frame: 图表.bounds)
        containerView.layer.addSublayer(gradientLayer)
        
        // 设定maskView
        if #available(iOS 8.0, *) {
            图表Bg.maskView = containerView
        } else {
            // Fallback on earlier versions
            图表Bg.layer.mask = gradientLayer
        }
    }
    
    //showChart
    func 显示图表(){
        self.hidden = false
        //计算最大值和坐标点
        let 最大值: Int = 纵坐标数据.maxElement()!
        坐标点.removeAll()
        for i in 0..<纵坐标数据.count {
            let width = CGFloat(i + 1) / CGFloat(纵坐标数据.count + 1) * (UIScreen.mainScreen().applicationFrame.size.width - 30)//rect.width
            let height = (1 - CGFloat(纵坐标数据[i]) / CGFloat(最大值)) * (140 - 上边距) + 上边距//rect.height
            坐标点.append(CGPointMake(width, height))
        }
        图表Bg.坐标点 = 坐标点
        图表.坐标点 = 坐标点
        刷新图表()
    }
    
    func 刷新图表(){
        标题.text = "近\(横坐标数据.count)天来访统计"
        总计.text = "\(纵坐标数据.reduce(0, combine: {$0 + $1}))"
        最大值.text = "\(纵坐标数据.maxElement()!)"
        if(横坐标数据.count != 横坐标view.subviews.count){
            创建横坐标label()
        }
        设置横坐标中心点()
        图表Bg.setNeedsDisplay()
        图表.setNeedsDisplay()
    }
    
    func 创建横坐标label(){
        for view in 横坐标view.subviews {
            view.removeFromSuperview()
        }
        for _ in 0..<横坐标数据.count {
            let label = UILabel()
            label.font = UIFont.systemFontOfSize(12)
            label.textColor = UIColor.whiteColor()
            label.textAlignment = NSTextAlignment.Center
            //label.backgroundColor = UIColor(white: 1, alpha: CGFloat(i + 1) / CGFloat(纵坐标数据.count))//查看label位置
            横坐标view.addSubview(label)
        }
    }
    
    func 设置横坐标中心点(){
        for i in 0..<横坐标view.subviews.count {
            let label = 横坐标view.subviews[i] as! UILabel
            label.text = 横坐标数据[i]
            label.sizeToFit()
            let width = CGFloat(i + 1) / CGFloat(横坐标数据.count + 1) * (UIScreen.mainScreen().applicationFrame.size.width - 30)
            label.center = CGPointMake(width, 25)
        }
    }
}
