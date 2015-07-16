//
//  StatePickerTableViewController.swift
//  DelegateExample
//
//  Created by CursoIOS on 7/7/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import UIKit

protocol StatePickerTableViewControllerDelegate: class {
    func statePickerTableViewController(vc: StatePickerTableViewController, didSelectState state: String)
}

class StatePickerTableViewController: UITableViewController {
    
    private let states = ["Acre", "Alagoas", "Amapá", "Amazonas", "Bahia", "Ceará", "Distrito Federal",
        "Espírito Santo", "Goiás", "Maranhão", "Mato Grosso", "Mato Grosso do Sul", "Minas Gerais",
        "Pará", "Paraíba", "Paraná", "Pernambuco", "Piauí", "Rio de Janeiro", "Rio Grande do Norte",
        "Rio Grande do Sul", "Rondônia", "Roraima", "Santa Catarina", "São Paulo", "Sergipe",
        "Tocantins"]
    
    weak var delegate: StatePickerTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = dequeueReusableCell(Reusable.Cell, forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = states[indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let state = states[indexPath.row]
        delegate?.statePickerTableViewController(self, didSelectState: state)
    }
}
