//
//  ViewController.swift
//  DelegateExample
//
//  Created by CursoIOS on 7/7/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import UIKit

class ViewController: UIViewController, StatePickerTableViewControllerDelegate {

    @IBOutlet private weak var selectedStateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue == Segue.SelectState {
            if let navigationController = segue.destinationViewController as? UINavigationController,
                vc = navigationController.topViewController as? StatePickerTableViewController {
                    vc.delegate = self
            }
        }
    }
    
    // MARK: StatePickerTableViewControllerDelegate
    func statePickerTableViewController(vc: StatePickerTableViewController, didSelectState state: String) {
        selectedStateLabel.text = "Você selecionou \(state)"
        dismissViewControllerAnimated(true, completion: nil)
    }
}

