//
//  DottedLine.swift
//  NiceChart
//
//  Created by jyb on 15/12/25.
//  Copyright © 2015年 tzrl. All rights reserved.
//

import UIKit

class DottedLine: UIView {
    
    var 虚线颜色 = UIColor.whiteColor()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let lengths: [CGFloat] = [5.0, 4.0]
        CGContextSetStrokeColorWithColor(context, 虚线颜色.CGColor)
        CGContextSetLineDash(context, 0, lengths, 2)
        CGContextMoveToPoint(context, 0, self.frame.size.height / 2)
        CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height / 2)
        CGContextStrokePath(context)
    }

}
