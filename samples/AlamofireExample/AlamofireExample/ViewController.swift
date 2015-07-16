//
//  ViewController.swift
//  AlamofireExample
//
//  Created by CursoIOS on 7/8/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var ipLabel: UILabel!
    
    private let httpClient = HTTPClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        httpClient.getIP { result in
            if let ip = result.value {
                self.ipLabel.text = ip
            } else if let optionalError = result.error, error = optionalError {
                self.ipLabel.text = error.localizedDescription
            } else {
                self.ipLabel.text = "Erro desconhecido."
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

