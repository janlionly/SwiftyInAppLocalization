//
//  ViewController.swift
//  InAppLocalizationDemo
//
//  Created by janlionly on 2020/7/21.
//  Copyright © 2020 janlionly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var helloLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helloLabel.text = NSLocalizedString("Hello", comment: "")
    }
}

