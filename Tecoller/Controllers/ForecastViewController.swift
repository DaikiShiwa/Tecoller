//
//  ForecastViewController.swift
//  Tecoller
//
//  Created by 志波大輝 on 2018/11/28.
//  Copyright © 2018 志波大輝. All rights reserved.
//

import UIKit
import Charts

class ForecastViewController: UIViewController {

    
    var LineChartView: CombinedChartView!
    var lineDataSet: LineChartDataSet!
    
//    var times: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //combinedDataを結合グラフに設定する
        let combinedData = CombinedChartData()
        
        //結合グラフに線グラフのデータ読み出し
        combinedData.lineData = generateLineData()
        
        //グラフのサイズ設定、座標設定
        LineChartView = CombinedChartView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width , height: self.view.frame.height - 20))

        //chartのデータにcombinedDataを挿入する
        LineChartView.data = combinedData
        
        let leftAxis = LineChartView.leftAxis
        leftAxis.labelTextColor = .magenta
        leftAxis.axisMaximum = 70
        leftAxis.axisMinimum = 25
        leftAxis.drawGridLinesEnabled = true
        leftAxis.granularityEnabled = true
        
        let rightAxis = LineChartView.rightAxis
        rightAxis.labelTextColor = .blue
        rightAxis.axisMaximum = 70
        rightAxis.axisMinimum = 25
        rightAxis.drawGridLinesEnabled = true
        rightAxis.granularityEnabled = true
        
        
        //chartを出力
        LineChartView.animate(xAxisDuration: 3.5)
        self.view.addSubview(LineChartView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateLineData() -> LineChartData
        {
        //リストを作り、グラフのデータを追加する方法（GitHubにあったCombinedChartViewとかMPAndroidChartのwikiを参考にしている
        //データを入れていく、多重配列ではないため別々にデータは追加していく
            let values: [Double] = [28.0, 28.2, 30.8, 32.0, 33.5, 35.0, 36.2, 36.5, 35.6, 34.1, 33.7, 32.0, 31.5]
            
            let values2: [Double]  = [70, 65, 57, 50, 47, 46, 44, 43, 47, 53, 59, 62, 65]
            
            let values3: [Double]  = [36, 36.5, 37.6, 38, 38.7, 39.5, 40.4, 41, 40, 39.4, 38.5, 38.0, 37]
            
            let time : [Double] = [6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]
            
//            let time2 : [Double] = [6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]
            
//            let time3 : [Double] = [6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]
            
            //DataSetを行うために必要なEntryの変数を作る　データによって入れるデータが違うため複数のentriesが必要になる？
            var entries: [ChartDataEntry] = Array()
            for (i, value) in values.enumerated(){
                entries.append(ChartDataEntry(x: time[i], y: value, icon: UIImage(named: "icon", in: Bundle(for: self.classForCoder), compatibleWith: nil)))
            }
            
            var entries2: [ChartDataEntry] = Array()
            for (i, value) in values2.enumerated(){
                entries2.append(ChartDataEntry(x: time[i], y: value, icon: UIImage(named: "icon", in: Bundle(for: self.classForCoder), compatibleWith: nil)))
            }
            
            var entries3: [ChartDataEntry] = Array()
            for (i, value) in values3.enumerated(){
                entries3.append(ChartDataEntry(x: time[i], y: value, icon: UIImage(named: "icon", in: Bundle(for: self.classForCoder), compatibleWith: nil)))
            }
            
            //データを送るためのDataSet変数をリストで作る
            var linedata:  [LineChartDataSet] = Array()
            
            //リストにデータを入れるためにデータを成形している
            //データの数値と名前を決める
            lineDataSet = LineChartDataSet(values: entries, label: "Line chart unit test data")
            lineDataSet.drawIconsEnabled = false
            //グラフの線の色とマルの色を変えている
            lineDataSet.colors = [NSUIColor.orange]
            lineDataSet.circleColors = [NSUIColor.orange]
            lineDataSet.circleRadius = 4.0
            //上で作ったデータをリストにappendで入れる
            linedata.append(lineDataSet)
            
            //上に同じ
            lineDataSet = LineChartDataSet(values: entries2, label: "test data2")
            lineDataSet.drawIconsEnabled = false
            lineDataSet.colors = [NSUIColor.blue]
            lineDataSet.circleColors = [NSUIColor.blue]
            lineDataSet.circleRadius = 4.0
            linedata.append(lineDataSet)
            
            //上に同じ
            lineDataSet = LineChartDataSet(values: entries3, label: "test data3")
            lineDataSet.drawIconsEnabled = false
            lineDataSet.colors = [NSUIColor.magenta]
            lineDataSet.circleColors = [NSUIColor.magenta]
            linedata.append(lineDataSet)
            
            
            //データを返す。今回のデータは複数なのでdataSetsになる
            return LineChartData(dataSets: linedata)
    }
}
//        times = ["6時", "7時", "8時", "9時", "10時", "11時", "12時", "13時", "14時", "15時", "16時", "17時", "18時"]
//

//
//        LineChartView.animate(xAxisDuration: 2.5)
//        LineChartView.dragEnabled = true
//        LineChartView.setScaleEnabled(true)
//        LineChartView.pinchZoomEnabled = true

//        let l = LineChartView.legend
//        l.form = .line
//        l.font = UIFont(name: "HelveticaNeue-Light", size: 11)!
//        l.textColor = .white
//        l.horizontalAlignment = .left
//        l.verticalAlignment = .bottom
//        l.orientation = .horizontal
//        l.drawInside = false
//
//        let xAxis = LineChartView.xAxis
//        xAxis.labelFont = .systemFont(ofSize: 11)
//        xAxis.labelTextColor = .white
//        xAxis.drawAxisLineEnabled = false
//
//        let leftAxis = LineChartView.leftAxis
//        leftAxis.labelTextColor = UIColor(red: 51/255, green: 181/255, blue: 229/255, alpha: 1)
//        leftAxis.axisMaximum = 200
//        leftAxis.axisMinimum = 0
//        leftAxis.drawGridLinesEnabled = true
//        leftAxis.granularityEnabled = true
//
//        let rightAxis = LineChartView.rightAxis
//        rightAxis.labelTextColor = .red
//        rightAxis.axisMaximum = 900
//        rightAxis.axisMinimum = -200
//        rightAxis.granularityEnabled = false
//
//    var chart: CombinedChartView!
//    var lineDataSet: LineChartDataSet!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        //combinedDataを結合グラフに設定する
//        let combinedData = CombinedChartData()
//
//        //結合グラフに線グラフのデータ読み出し
//        combinedData.lineData = generateLineData()
//
//        //グラフのサイズ設定、座標設定
//        chart = CombinedChartView(frame: CGRect(x: 0, y: 20, width: self.view.frame.width , height:         self.view.frame.height - 20))
//
//        //chartのデータにcombinedDataを挿入する
//        chart.data = combinedData
//
//        //chartを出力
//        self.view.addSubview(chart)
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//    func generateLineData() -> LineChartData
//    {
//
//        //リストを作り、グラフのデータを追加する方法（GitHubにあったCombinedChartViewとかMPAndroidChartのwikiを参考にしている
//        let values: [Double] = [0, 254, 321, 512, 214, 444, 967, 101, 765, 228,
//                                726, 253, 20, 123, 512, 448, 557, 223, 465, 291,
//                                979, 134, 864, 481, 405, 711, 1106, 411, 455, 761]
//        let values2: [Double] = [201,220,203,420,520,620,720,820,920,200,
//                                 201,220,203,420,520,657,757,857,579,570,
//                                 571,572,573,574,575,576,577,578,579,571]
//        let date : [Double] = [1,2,3,4,5,6,7,8,9,10,
//                               11,12,13,14,15,16,17,18,19,20,
//                               21,22,23,24,25,26,27,28,29,30]
//        let date2 : [Double] = [1,5,3,7,9,14,16,17,18,20,
//                                21,24,25,26,27,28,29,30,32,36,
//                                40,41,42,43,44,45,46,47,48,49]
//
//
//        //DataSetを行うために必要なEntryの変数を作る　データによって入れるデータが違うため複数のentriesが必要になる？
//        //多分、データ毎にappendまでをしていくことによってentriesを少なくすることはできると思う
//        var entries: [ChartDataEntry] = Array()
//        for (i, value) in values.enumerated(){
//            entries.append(ChartDataEntry(x: date[i], y: value, icon: UIImage(named: "icon", in: Bundle(for: self.classForCoder), compatibleWith: nil)))
//        }
//        var entries2: [ChartDataEntry] = Array()
//        for (i, value) in values2.enumerated(){
//            entries2.append(ChartDataEntry(x: date2[i], y: value, icon: UIImage(named: "icon", in: Bundle(for: self.classForCoder), compatibleWith: nil)))
//        }
//
//        //データを送るためのDataSet変数をリストで作る
//        var linedata:  [LineChartDataSet] = Array()
//
//        //リストにデータを入れるためにデータを成形している
//        //データの数値と名前を決める
//        lineDataSet = LineChartDataSet(values: entries, label: "Line chart unit test data")
//        lineDataSet.drawIconsEnabled = false
//        //グラフの線の色とマルの色を変えている
//        lineDataSet.colors = [NSUIColor.red]
//        lineDataSet.circleColors = [NSUIColor.red]
//        //上で作ったデータをリストにappendで入れる
//        linedata.append(lineDataSet)
//
//        //上に同じ
//        lineDataSet = LineChartDataSet(values: entries2, label: "test data2")
//        lineDataSet.drawIconsEnabled = false
//        lineDataSet.colors = [NSUIColor.blue]
//        lineDataSet.circleColors = [NSUIColor.blue]
//        linedata.append(lineDataSet)
//
//
//        //データを返す。今回のデータは複数なのでdataSetsになる
//        return LineChartData(dataSets: linedata)
//    }
//
//}
