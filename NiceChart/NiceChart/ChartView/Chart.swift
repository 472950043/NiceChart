//
//  Chart.swift
//  NiceChart
//
//  Created by jyb on 15/12/25.
//  Copyright © 2015年 tzrl. All rights reserved.
//

import UIKit

class Chart: UIView {
    
    var 上边距: CGFloat = 40
    var 线宽度: CGFloat = 1
    var 线颜色 = UIColor.whiteColor()
    var 点半径: CGFloat = 4
    var 点颜色 = UIColor.whiteColor()
    var 坐标点 = [CGPoint]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        //添加线
        CGContextSetStrokeColorWithColor(context, 线颜色.CGColor)
        CGContextSetLineWidth(context, 线宽度)
        if(坐标点.count > 0){
            CGContextAddLines(context, 坐标点, 坐标点.count)
            CGContextStrokePath(context)
        }
        //添加圆
        CGContextSetFillColorWithColor(context, 点颜色.CGColor)
        CGContextSetLineWidth(context, 0)
        for i in 0..<坐标点.count {
            CGContextAddArc(context, 坐标点[i].x, 坐标点[i].y, 点半径, 0, CGFloat(M_PI * Double(2)), 0)
            CGContextDrawPath(context, CGPathDrawingMode.Fill)
        }
    }

}
