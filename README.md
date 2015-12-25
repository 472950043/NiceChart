# NiceChart
######  一个简单漂亮的模仿iOS8健康应用的图表（A simple and beautiful chart like iOS8 Health APP）
开发环境Xcode 7.2 (7C68) + iOS SDK 9.2 (13C75) + Swift 2.1  

支持系统iOS7+  

支持设备iPhone4s+  

## 快速集成，仅需三步：  
第一步：
	
	导入ChartView文件夹到你的工程

第二步：
	
	//创建一个chart并把它加入到chartView中
	var chartView: UIView!
	var chart: ChartView!  
	chart = ChartView.instanceChartView()  
	chart.frame = chartView.bounds
	chartView.addSubview(chart)
	
第三步：

	//给chart设置纵坐标数据、横坐标数据和背景颜色，再调用显示图表方法即可
	chart.纵坐标数据 = [80,30,60,78,50,60]
	chart.横坐标数据 = ["11月8","9","10","11","12","今日"]
	chart.backgroundColor = UIColor.blueColor()
	chart.显示图表()
	
## 可按照自己需求，修改ChartView.swift中的属性：

	var 上下线颜色 = UIColor(white: 1, alpha: 0.5)
    var 线颜色 = UIColor.whiteColor()
    var 虚线颜色 = UIColor(white: 1, alpha: 0.8)
    var 线宽度: CGFloat = 0.5
    var 上边距: CGFloat = 40
    var 点半径: CGFloat = 4 
    
###### 默认效果展示：  
![效果图1](https://raw.githubusercontent.com/472950043/NiceChart/master/效果图-1.png)
![效果图1](https://raw.githubusercontent.com/472950043/NiceChart/master/效果图-2.png)