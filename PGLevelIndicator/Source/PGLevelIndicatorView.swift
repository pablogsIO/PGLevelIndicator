//
//  PGLevelIndicator.swift
//  PGLevelIndicator
//
//  Created by Pablo on 16/10/2018.
//  Copyright © 2018 Pablo Garcia. All rights reserved.
//

import UIKit

enum Level {
    case low
    case medium
    case high
}

internal class PGLevelIndicatorView: UIView {

    var label: UILabel?
    var shapeLayer = CAShapeLayer()
    var bezierPath = UIBezierPath()
    var level = Level.low
    private var radius = CGFloat(0)

    init(frame: CGRect, parameters: ItemParameters, radius: CGFloat) {

        let maximun = max(frame.width, frame.height)

        super.init(frame: CGRect(origin: frame.origin, size: CGSize(width: maximun, height: maximun)))

        self.radius = radius*maximun/3
        self.backgroundColor = UIColor.clear
        setCircle()
        label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width/2, height: 20))
        label?.text = parameters.title
        label?.textAlignment = .left
        label?.textColor = parameters.titleColor
        self.addSubview(label!)
        label?.translatesAutoresizingMaskIntoConstraints = false
        setConstraints()
        shapeLayer.strokeColor = parameters.titleColor.cgColor
        level = parameters.level
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:))))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func handleTap(sender: UITapGestureRecognizer? = nil) {

        var endValue = 0.0
        switch level {
        case .low:
            endValue = 0.3
        case .medium:
            endValue = 0.6
        case .high:
            endValue = 1.0
        }

        let drawProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")

        drawProgressAnimation.toValue = endValue
        drawProgressAnimation.duration = 2
        drawProgressAnimation.fillMode = .forwards
        drawProgressAnimation.isRemovedOnCompletion = false
        shapeLayer.add(drawProgressAnimation, forKey: "test")

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
        let drawProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")

        drawProgressAnimation.toValue = endValue
        drawProgressAnimation.duration = 2
        drawProgressAnimation.fillMode = .forwards
        drawProgressAnimation.isRemovedOnCompletion = false
        shapeLayer.add(drawProgressAnimation, forKey: "drawline")

    }

    private func setConstraints() {

        NSLayoutConstraint.init(item: label!, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: self.frame.size.height/2-radius-(label?.frame.size.height)!/2).isActive = true
        NSLayoutConstraint.init(item: label!, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.4, constant: 0).isActive = true
        NSLayoutConstraint.init(item: label!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20).isActive = true
        NSLayoutConstraint.init(item: label!, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: (self.frame.width/2+CGFloat(10))).isActive = true

    }

}
