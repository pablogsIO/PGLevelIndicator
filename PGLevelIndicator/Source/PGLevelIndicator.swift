//
//  PGLevelIndicator.swift
//  PGLevelIndicator
//
//  Created by Pablo on 17/10/2018.
//  Copyright © 2018 Pablo Garcia. All rights reserved.
//

import UIKit

struct ItemParameters {
    var title: String
    var titleColor: UIColor
    var level: Level
}

class PGLevelIndicator: UIView {

    private var levelIndicators = [PGLevelIndicatorView]()

    init(frame: CGRect, itemsParameters: [ItemParameters]) {
        super.init(frame: frame)
        let factor = 0.2
        // TODO: Change
        var total = 1.0
        for parameters in itemsParameters {

            let width = self.frame.size.width
            let levelIndicator = PGLevelIndicatorView(frame: CGRect(x: 0, y: 0, width: width, height: width), parameters: parameters, radius: CGFloat(total))
            levelIndicators.append(levelIndicator)
            self.addSubview(levelIndicator)
            levelIndicator.translatesAutoresizingMaskIntoConstraints = false
            setConstraints(view: levelIndicator, factor: total)
            total -= factor
        }

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setConstraints(view: UIView, factor: Double) {

        NSLayoutConstraint.init(item: view, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: view, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: view, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint.init(item: view, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0).isActive = true

//        NSLayoutConstraint.init(item: view, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: CGFloat(factor), constant: 0).isActive = true
//        NSLayoutConstraint.init(item: view, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: CGFloat(factor), constant: 0).isActive = true

    }
    
    public func setLevelValue(index: Int, value: Double) {
        levelIndicators[index].setValue(value: value)
    }

}
