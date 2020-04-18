//
//  ViewController.swift
//  PPFCircleVDemo
//
//  Created by jdp on 2020/4/16.
//  Copyright © 2020 PPF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    weak var v:PPFMultiplePercentCircleView!
    weak var v:PPFMultiplePercentCircleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let list = [
            PPFMultiplePercentCircleView.Circle(lineForegroundColor: randomColor(), lineBackgroundColor: randomColor(), lineWidth: 10, linePercent: 0.30),
            PPFMultiplePercentCircleView.Circle(lineForegroundColor: randomColor(), lineBackgroundColor: randomColor(), lineWidth: 10, linePercent: 0.10),
            PPFMultiplePercentCircleView.Circle(lineForegroundColor: randomColor(), lineBackgroundColor: randomColor(), lineWidth: 10, linePercent: 0.08),
            PPFMultiplePercentCircleView.Circle(lineForegroundColor: randomColor(), lineBackgroundColor: randomColor(), lineWidth: 10, linePercent: 1),
            PPFMultiplePercentCircleView.Circle(lineForegroundColor: randomColor(), lineBackgroundColor: randomColor(), lineWidth: 10, linePercent: 0.30),
            PPFMultiplePercentCircleView.Circle(lineForegroundColor: randomColor(), lineBackgroundColor: randomColor(), lineWidth: 10, linePercent: 0.50),
            PPFMultiplePercentCircleView.Circle(lineForegroundColor: randomColor(), lineBackgroundColor: randomColor(), lineWidth: 10, linePercent: 0.78),
            PPFMultiplePercentCircleView.Circle(lineForegroundColor: randomColor(), lineBackgroundColor: randomColor(), lineWidth: 10, linePercent: 0),
        ]
                
        let v = PPFMultiplePercentCircleView(circles: [], holeRadius: 20, lineSpace: 1)
        v.backgroundColor = UIColor.white
        v.clipsToBounds = true
        v.frame = CGRect(x: view.bounds.width / 2 - 150, y: 100, width: 300, height: 300)
        view.addSubview(v)
        v.set(circles: list, animate: false)
        self.v = v
        
        let c = UIButton(type: .custom)
        c.setTitle("Reset", for: .normal)
        c.backgroundColor = randomColor()
        c.frame = CGRect(x: view.bounds.width / 2 - 50, y: 500, width: 100, height: 50)
        c.addTarget(self, action: #selector(tapChange), for: .touchUpInside)
        view.addSubview(c)
        
        let e = UIButton(type: .custom)
        e.setTitle("Add one", for: .normal)
        e.backgroundColor = randomColor()
        e.frame = CGRect(x:  view.bounds.width / 2 - 50, y: 560, width: 100, height: 50)
        e.addTarget(self, action: #selector(tapForInsertCircle), for: .touchUpInside)
        view.addSubview(e)
        
        let b = UIButton(type: .custom)
        b.setTitle("Remove one", for: .normal)
        b.backgroundColor = randomColor()
        b.frame = CGRect(x:  view.bounds.width / 2 - 50, y: 620, width: 100, height: 50)
        b.addTarget(self, action: #selector(removeCircle), for: .touchUpInside)
        view.addSubview(b)
    }
    
    @objc func tapChange() {
        let list = [
            PPFMultiplePercentCircleView.Circle(lineForegroundColor: randomColor(), lineBackgroundColor: randomColor(), lineWidth: 10, linePercent: Double(arc4random_uniform(100)) / 100.0),
            PPFMultiplePercentCircleView.Circle(lineForegroundColor: randomColor(), lineBackgroundColor: randomColor(), lineWidth: 10, linePercent: Double(arc4random_uniform(100)) / 100.0),
            PPFMultiplePercentCircleView.Circle(lineForegroundColor: randomColor(), lineBackgroundColor: randomColor(), lineWidth: 10, linePercent: Double(arc4random_uniform(100)) / 100.0),
            PPFMultiplePercentCircleView.Circle(lineForegroundColor: randomColor(), lineBackgroundColor: randomColor(), lineWidth: 10, linePercent: Double(arc4random_uniform(100)) / 100.0),
            PPFMultiplePercentCircleView.Circle(lineForegroundColor: randomColor(), lineBackgroundColor: randomColor(), lineWidth: 10, linePercent: Double(arc4random_uniform(100)) / 100.0),
            PPFMultiplePercentCircleView.Circle(lineForegroundColor: randomColor(), lineBackgroundColor: randomColor(), lineWidth: 10, linePercent: Double(arc4random_uniform(100)) / 100.0),
            PPFMultiplePercentCircleView.Circle(lineForegroundColor: randomColor(), lineBackgroundColor: randomColor(), lineWidth: 10, linePercent: Double(arc4random_uniform(100)) / 100.0),
            PPFMultiplePercentCircleView.Circle(lineForegroundColor: randomColor(), lineBackgroundColor: randomColor(), lineWidth: 10, linePercent: Double(arc4random_uniform(100)) / 100.0),
        ]
        
        v.set(circles: list, animate: true,duration:CFTimeInterval(arc4random_uniform(3)))
    }
    
    @objc func tapForInsertCircle() {
        let circle = PPFMultiplePercentCircleView.Circle(lineForegroundColor: randomColor(), lineBackgroundColor: randomColor(), lineWidth: CGFloat(arc4random_uniform(5) + 8), linePercent: Double(arc4random_uniform(100)) / 100.0)
        v.append(circle: circle, animate: true)
    }
    
    @objc func removeCircle() {
        v.removeCircleAt(index:self.v.circles.count - 6, animate: true)
    }
    
    func randomColor() -> UIColor {
        let r:CGFloat = CGFloat(arc4random_uniform(256)) / 256
        let g:CGFloat = CGFloat(arc4random_uniform(256)) / 256
        let b:CGFloat = CGFloat(arc4random_uniform(256)) / 256
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}


