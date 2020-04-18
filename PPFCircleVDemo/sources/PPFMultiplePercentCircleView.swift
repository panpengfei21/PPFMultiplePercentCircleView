//
//  PPFMultiplePercentCircleV.swift
//  PPFCircleVDemo
//
//  Created by jdp on 2020/4/16.
//  Copyright © 2020 PPF. All rights reserved.
//

import UIKit

@objc class PPFMultiplePercentCircleView: UIView {

    @objc class Circle:NSObject {
        let lineForegroundColor:UIColor
        let lineBackgroundColor:UIColor
        let lineWidth:CGFloat
        var linePercent:Double
        let lineCap:CAShapeLayerLineCap
        let startAngle:CGFloat
        let clockwise:Bool
        
        @objc init(lineForegroundColor:UIColor,lineBackgroundColor:UIColor,lineWidth:CGFloat,linePercent:Double,lineCap:CAShapeLayerLineCap = .round,startAngle:CGFloat = 0,clockwise:Bool = true) {
            self.lineForegroundColor = lineForegroundColor
            self.lineBackgroundColor = lineBackgroundColor
            self.lineWidth = lineWidth
            self.linePercent = linePercent == 0 ? 0.001 : linePercent
            self.lineCap = lineCap
            self.startAngle = startAngle
            self.clockwise = clockwise
            super.init()
        }
        
        func draw(center:CGPoint,radius:CGFloat ,baseLayer:CALayer,animate:Bool,duration:CFTimeInterval = 0.8){
            // background layer  --- a circle
            let bBezier = UIBezierPath(ovalIn: CGRect(x: center.x - radius, y: center.y - radius, width: 2 * radius, height: 2 * radius))

            let bgLayer = CAShapeLayer()
            bgLayer.path = bBezier.cgPath
            
            bgLayer.strokeColor = lineBackgroundColor.cgColor
            bgLayer.fillColor = UIColor.clear.cgColor
            bgLayer.lineWidth = lineWidth
            
            baseLayer.addSublayer(bgLayer)
            
            
            // foreground layer
            let end:CGFloat
            if clockwise{
                end = startAngle + CGFloat(Double.pi * 2 * linePercent)
            }else{
                end = startAngle - CGFloat(Double.pi * 2 * linePercent)
            }
            
            let bezier = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: end, clockwise: clockwise)
            
            let fgLayer = CAShapeLayer()
            fgLayer.path = bezier.cgPath
            fgLayer.strokeColor = lineForegroundColor.cgColor
            fgLayer.fillColor = UIColor.clear.cgColor
            fgLayer.lineWidth = lineWidth
            fgLayer.lineCap = lineCap
            
            bgLayer.addSublayer(fgLayer)
            
            if animate {
                let an = CABasicAnimation(keyPath: "strokeEnd")
                an.fromValue = 0
                an.toValue = 1
                an.duration = duration
                fgLayer.add(an, forKey: nil)
            }
        }
    }
    
    @objc private(set) var holeRadius:CGFloat
    @objc private(set) var circles:[Circle]
    @objc private(set) var lineSpace:CGFloat
    
    private var animate:Bool = true
    private var duration:CFTimeInterval = 0.8
        
    @objc init(circles:[Circle],holeRadius:CGFloat = 10,lineSpace:CGFloat = 0){
        self.circles = circles
        self.lineSpace = lineSpace
        self.holeRadius = holeRadius
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        layer.sublayers?.forEach(){
            $0.removeFromSuperlayer()
        }

        let center = CGPoint(x: rect.midX, y: rect.midY)
        var radius:CGFloat = holeRadius
        for i in 0 ..< circles.count {
            let c = circles[i]
            radius += c.lineWidth / 2.0
            c.draw(center: center, radius: radius, baseLayer: layer, animate: animate,duration: duration)
            radius += c.lineWidth / 2.0 + lineSpace
        }
    }
    
    // MARK: -------------interface
    @objc func set(circles:[Circle],animate:Bool = true,duration:CFTimeInterval = 0.8){
        self.animate = animate
        self.circles = circles
        self.duration = duration
        self.setNeedsDisplay()
    }
    
    @objc func append(circle:Circle,animate:Bool,duration:CFTimeInterval = 0.8) {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)

        var radius = holeRadius
        circles.forEach(){
            radius += $0.lineWidth + self.lineSpace
        }
        radius += circle.lineWidth / 2
        
        self.circles.append(circle)
        
        circle.draw(center: center, radius: radius, baseLayer: layer, animate: animate)
    }
    
    @objc func removeCircleAt(index:Int,animate:Bool,duration:CFTimeInterval = 0.8) {
        guard index >= 0 && index < layer.sublayers?.count ?? 0 else {
            return
        }
        self.animate = animate
        self.duration = duration
        self.circles.remove(at: index)
        setNeedsDisplay()
    }
}
