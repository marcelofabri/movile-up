//
//  DetailViewController.swift
//  SegueExample
//
//  Created by CursoIOS on 7/7/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet private weak var textLabel: UILabel!
    
    var customText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let text = customText {
            textLabel.text = text
        }
    }
}
