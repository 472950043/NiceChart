//
//  ChartBg.swift
//  NiceChart
//
//  Created by jyb on 15/12/25.
//  Copyright © 2015年 tzrl. All rights reserved.
//

import UIKit

class ChartBg: UIView {
    
    var 上边距: CGFloat = 40
    var 背景颜色 = UIColor.whiteColor()
    var 坐标点 = [CGPoint]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        if(坐标点.count > 0){
            let context = UIGraphicsGetCurrentContext()
            CGContextSetFillColorWithColor(context, 背景颜色.CGColor)
            
            坐标点.insert(CGPointMake(坐标点[0].x, rect.height), atIndex: 0)
            坐标点.append(CGPointMake(坐标点[坐标点.count - 1].x, rect.height))
            
            CGContextAddLines(context, 坐标点, 坐标点.count)//添加线
            CGContextClosePath(context)//封起来
            CGContextDrawPath(context, CGPathDrawingMode.Fill)//根据坐标绘制路径
        }
    }

}
