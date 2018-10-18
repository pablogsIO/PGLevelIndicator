//
//  ViewController.swift
//  PGLevelIndicator
//
//  Created by Pablo on 16/10/2018.
//  Copyright © 2018 Pablo Garcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var items: UISegmentedControl!

    private var levelIndicator: PGLevelIndicator?

    override func viewDidLoad() {
        super.viewDidLoad()

        let parameters = [ItemParameters(title: "nO2 Band", titleColor: UIColor.blue, level: .low), ItemParameters(title: "o3 Band", titleColor: UIColor.yellow, level: .medium), ItemParameters(title: "pM10 Band", titleColor: UIColor.green, level: .high), ItemParameters(title: "pM25 Band", titleColor: UIColor.orange, level: .low)]
        levelIndicator = PGLevelIndicator(frame: CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: self.view.frame.size.width), itemsParameters: parameters)
        self.view.addSubview(levelIndicator!)

        self.view.backgroundColor = UIColor.black
//        NSLayoutConstraint.init(item: levelIndicator, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint.init(item: levelIndicator, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint.init(item: levelIndicator, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1, constant: 0).isActive = true
//        NSLayoutConstraint.init(item: levelIndicator, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1, constant: 0).isActive = true

    }
    @IBAction func changeValue(_ sender: Any) {

        let randomNumber = Float.random(in: 0 ..< 1)
        print(randomNumber)
        levelIndicator?.setLevelValue(index: items.selectedSegmentIndex, value: Double(randomNumber))
    }
}
