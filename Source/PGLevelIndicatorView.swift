//
//  PGLevelIndicator.swift
//  PGLevelIndicator
//
//  Created by Pablo on 16/10/2018.
//  Copyright © 2018 Pablo Garcia. All rights reserved.
//

import UIKit

public enum Level {
    case low
    case medium
    case high
}

open class PGLevelIndicatorView: UIView {

    private var title: UILabel?
    private var ringValue: UILabel?

    private var shapeLayer = CAShapeLayer()
    private var bezierPath = UIBezierPath()
    private var level = Level.low
    private var radius: CGFloat = 0

    private var progress: Double = 0 {
        willSet(newValue) {
            shapeLayer.strokeEnd = CGFloat(newValue)
            ringValue?.text = String(Int(newValue*100))
        }
    }

    private var timer: Timer?
    private var progressValue: Double = 0
    private let duration: Double = 2.0
    private var progressIncrement: Double = 0.1
    private let timeInterval = 0.1
    private var timeEleapse = 0.0

    public init(frame: CGRect, parameters: ItemParameters, radius: CGFloat) {

        let maximun = max(frame.width, frame.height)

        super.init(frame: CGRect(origin: frame.origin, size: CGSize(width: maximun, height: maximun)))

        self.radius = radius*maximun/3
        self.backgroundColor = UIColor.clear
        setCircle()
        setTitleLabel(titleName: parameters.title, color: parameters.titleColor)
        setRingValueLabel(color: parameters.titleColor)
        setConstraints()
        setRingValueLabelConstraints()
        shapeLayer.strokeColor = parameters.titleColor.cgColor
        level = parameters.level
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setTitleLabel(titleName: NSAttributedString, color: UIColor) {

        title = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width/2, height: 20))
        title?.attributedText = titleName
        title?.textAlignment = .left
        title?.textColor = color
        self.addSubview(title!)
        title?.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setRingValueLabel(color: UIColor) {
        ringValue = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width*0.1, height: 20))
        ringValue?.text = "0"
        ringValue?.font = ringValue?.font.withSize(12)
        ringValue?.textAlignment = .left
        ringValue?.textColor = color
        self.addSubview(ringValue!)
        ringValue?.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setCircle() {

        let lineWidth = CGFloat(5.0)
        bezierPath = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.height/2,
                                                     y: self.frame.size.height/2),
                                  radius: radius,
                                  startAngle: 3*CGFloat.pi/2,
                                  endAngle: 2*CGFloat.pi,
                                  clockwise: false)

        let baseShape = CAShapeLayer()
        baseShape.path = bezierPath.cgPath
        baseShape.strokeColor = UIColor.darkGray.cgColor
        baseShape.lineWidth = lineWidth
        baseShape.lineCap = .round

        baseShape.fillColor = UIColor.clear.cgColor

        shapeLayer.path = bezierPath.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineCap = .round
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = UIColor.clear.cgColor

        self.layer.addSublayer(baseShape)
        self.layer.addSublayer(shapeLayer)
    }

    public func setValue(value: Double) {
        timeEleapse = 0.0
        progressValue = 0
        shapeLayer.strokeEnd = 0
        progressIncrement = value/(duration*10)
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(self.updateShapeLayerStrokeEnd), userInfo: nil, repeats: true)

    }

    @objc func updateShapeLayerStrokeEnd() {
        timeEleapse += timeInterval
        if timeEleapse > duration {
            timer?.invalidate()
        }
        progressValue += progressIncrement
        self.progress = progressValue

    }

    public func setLevel(level: Level) {

        var endValue = 0.0
        switch level {
        case .low:
            endValue = 0.3
        case .medium:
            endValue = 0.6
        case .high:
            endValue = 1.0
        }
        setValue(value: endValue)

    }

    private func setConstraints() {

        NSLayoutConstraint.init(item: title!, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: self.frame.size.height/2-radius-(title?.frame.size.height)!/2).isActive = true
        NSLayoutConstraint.init(item: title!, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.4, constant: 0).isActive = true
        NSLayoutConstraint.init(item: title!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint.init(item: title!, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: (self.frame.width/2+CGFloat(10))).isActive = true

    }

    private func setRingValueLabelConstraints() {

        NSLayoutConstraint.init(item: ringValue!, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: self.frame.size.height/2-(ringValue?.frame.size.height)!).isActive = true
        NSLayoutConstraint.init(item: ringValue!, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: ringValue!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint.init(item: ringValue!, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: (self.frame.width/2+radius-(ringValue?.frame.size.width)!/4)).isActive = true
    }

}
