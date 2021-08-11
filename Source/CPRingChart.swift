//
//  DonutChart.swift
//  DonutChart
//
//  Created by Subhronil Saha on 10/08/21.
//

import Foundation
import UIKit
import CircleProgressView

public class CPRingChart: UIView {
    
    // Number of sections or number of rings in the chart
    public var sections = 0
    
    // Individual values of all rings
    // -> Can be a list of any values, not necessarily between 0...100
    // -> values.count == sections, ALWAYS
    public var values = [Double]()
    
    // List of Pie charts that will be rendered on screen
    private var pieCharts = [CircleProgressView]()
    
    // List of Pie Chart fill colors
    public var fillColors = [UIColor]()
    
    // List of Pie Chart angle offsets
    private var angleOffsets = [Double]()
    
    // Spacing between individual rings
    public var spacing : Double = 0.05
    
    // Width of each rinng
    public var ringWidth : CGFloat = 10
    
    // Boolean to make cap rounded or not
    public var roundedCap = true
    
    // Set center fill color for all charts
    public var centerFillColor : UIColor = .clear
    
    // MARK:- init
    //initWithFrame to init view from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    //common func to init our view
    private func setupView() {
        //backgroundColor = .red
        setupDefaults()
        showRingChart()
    }
    
    public func reloadChart() {
        showRingChart()
    }
}

//MARK:- Charts
extension CPRingChart {
    
    func setupDefaults() {
        
        self.values.removeAll()
        self.fillColors.removeAll()
        self.pieCharts.removeAll()
        self.angleOffsets.removeAll()
        
        // DUMMY DATA
        // let progs : [Double] = [20, 30, 40, 10, 50]
        // let colors : [UIColor] = [.blue, .black, .purple, .systemPink, .cyan]
        // for section in 0..<sections {
            // self.progressValues.append(progs[section])
            // self.pieChartColors.append(colors[section])
        // }
    }
    
    // Func to convert degree to radians
    func degToRad(_ rotationDegrees: Double) -> CGFloat {
        let rotationAngle = CGFloat(rotationDegrees * .pi/180.0)
        return rotationAngle
    }
    
    // Show Ring Chart
    func showRingChart() {
        
        // == Calculate sum of all individual progress values
        var totalVal = 0.0
        for value in self.values {
            totalVal += value
        }
        
        // == Spacing between rings = 5% of totalVal
        let spacingIndividual = self.spacing * totalVal
        
        let totalSpacing = Double(values.count) * spacingIndividual

        // == Calculate total sum of all progress values along with individual spacing for each
        var total = totalSpacing
        for value in self.values {
            total += value
        }
        
        // == Percent of spacing
        let spacingPerc = spacingIndividual / total
        
        // == Get the Circle Progress Percent Values
        var percentVals = [Double]()
        for i in 0..<self.values.count {
            // Percent (indicates the progress of the circleProgressView
            let perc = values[i] / total
            percentVals.append(perc)
        }

        // == Angle offsets (in degrees)
        var offsetTotals = [Double]()
        for i in 0..<self.values.count {
            var offset = 0.0
            if i == 0 {
                offset = percentVals[i] + spacingPerc
            } else {
                offset = percentVals[i] + spacingPerc + offsetTotals[i-1]
            }
            offsetTotals.append(offset)
        }
        for i in 0..<offsetTotals.count {
            offsetTotals[i] *= 360
        }
          
        
        // == Setup ring chart sections
        for i in 0..<values.count {
            
            let pie = CircleProgressView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))
            pieCharts.append(pie)
            pieCharts[i].trackFillColor = fillColors[i]
            pieCharts[i].trackBackgroundColor = .clear
            pieCharts[i].progress = percentVals[i]
            pieCharts[i].trackWidth = self.ringWidth
            pieCharts[i].roundedCap = true
            pieCharts[i].centerFillColor = self.centerFillColor
            pieCharts[i].backgroundColor = .clear
            if i > 0 {
                pieCharts[i].transform = CGAffineTransform(rotationAngle: degToRad(offsetTotals[i-1]))
            }
            self.addSubview(pieCharts[i])
        }
        
    }
    
}

