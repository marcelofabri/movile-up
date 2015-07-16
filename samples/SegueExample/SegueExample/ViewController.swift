//
//  ViewController.swift
//  SegueExample
//
//  Created by CursoIOS on 7/7/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue == Segue.DetailsSegue {
            let vc = segue.destinationViewController as! DetailViewController
            vc.customText = "Here's a text set on prepareForSegue"
        }
    }
}

