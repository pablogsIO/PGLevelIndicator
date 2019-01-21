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
        let parameters = self.getLevelIndicatorParameter()
        levelIndicator = PGLevelIndicator(frame: CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: self.view.frame.size.width), itemsParameters: parameters)
        self.view.addSubview(levelIndicator!)

        self.view.backgroundColor = UIColor.black
    }

    private func getLevelIndicatorParameter() -> [ItemParameters] {

        let font: UIFont? = UIFont(name: "Avenir-Book", size: 18)
        let fontSuper: UIFont? = UIFont(name: "Avenir-Book", size: 10)

        let attStringNO2: NSMutableAttributedString = NSMutableAttributedString(string: "NO2", attributes: [.font: font!])
        attStringNO2.setAttributes([.font: fontSuper!, .baselineOffset: -5], range: NSRange(location: 2, length: 1))

        let attStringO3: NSMutableAttributedString = NSMutableAttributedString(string: "O3", attributes: [.font: font!])
        attStringO3.setAttributes([.font: fontSuper!, .baselineOffset: -5], range: NSRange(location: 1, length: 1))

        let attStringpM10: NSMutableAttributedString = NSMutableAttributedString(string: "PM10", attributes: [.font: font!])
        attStringpM10.setAttributes([.font: fontSuper!, .baselineOffset: -5], range: NSRange(location: 2, length: 2))

        let attStringPM25: NSMutableAttributedString = NSMutableAttributedString(string: "PM2.5", attributes: [.font: font!])
        attStringPM25.setAttributes([.font: fontSuper!, .baselineOffset: -5], range: NSRange(location: 2, length: 3))

        let attStringSO2: NSMutableAttributedString = NSMutableAttributedString(string: "SO2", attributes: [.font: font!])
        attStringSO2.setAttributes([.font: fontSuper!, .baselineOffset: -5], range: NSRange(location: 2, length: 1))

        let parameters = [ItemParameters(title: attStringNO2, titleColor: UIColor.red, level: .low), ItemParameters(title: attStringO3, titleColor: UIColor.yellow, level: .medium), ItemParameters(title: attStringpM10, titleColor: UIColor.green, level: .high), ItemParameters(title: attStringPM25, titleColor: UIColor.orange, level: .low)]
        return parameters
    }
    @IBAction func changeValue(_ sender: Any) {

        let randomNumber = Float.random(in: 0 ..< 1)
        levelIndicator?.setLevelValue(index: items.selectedSegmentIndex, value: Double(randomNumber))
    }
}
