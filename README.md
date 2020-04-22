# PPFMultiplePercentCircleView
multiple circle which in one center point describe multiple percents

## 效果

![multiple percent circles](https://upload-images.jianshu.io/upload_images/2261768-21333821b3a1b4e6.gif?imageMogr2/auto-orient/strip)
## 引用

[GitHub](https://github.com/panpengfei21/PPFMultiplePercentCircleView.git)
```
pod 'PPFMultiplePercentCircleView'
```

## 怎么用

#### initialize
1.initialize circles that are displayed in PPFMultiplePercentCircleView
```
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

```
2.initialize 
```
        let v = PPFMultiplePercentCircleView(circles: [], holeRadius: 20, lineSpace: 1)
        v.backgroundColor = UIColor.white
        v.clipsToBounds = true
        v.frame = CGRect(x: view.bounds.width / 2 - 150, y: 100, width: 300, height: 300)
        view.addSubview(v)
        v.set(circles: list, animate: false)
        self.v = v

```

#### reset circles
```
v.set(circles: list, animate: true,duration:2)
```
#### remove circle
```
v.removeCircleAt(index:6, animate: true)
```

#### append circle
```
v.append(circle: circle, animate: true)
```
