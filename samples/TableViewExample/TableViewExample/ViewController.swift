//
//  ViewController.swift
//  TableViewExample
//
//  Created by CursoIOS on 7/8/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet private weak var tableView: UITableView!
    
    let teams = Team.allTeams()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 20 : teams.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(Reusable.Cell.identifier!, forIndexPath: indexPath) as! UITableViewCell
            cell.textLabel?.text = "Row \(indexPath.row)"
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier(Reusable.TeamCell.identifier!, forIndexPath: indexPath) as! TeamTableViewCell
            cell.loadTeam(teams[indexPath.row])
            
            return cell
        }
        
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Basic rows" : "Custom rows"
    }
    
    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return indexPath.section == 0 ? 44 : 88
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let title: String
        let text: String
        if indexPath.section == 0 {
            title = "Basic Row"
            text = "Row \(indexPath.row) was selected."
        } else {
            title = "Custom Row"
            text = "\(teams[indexPath.row].name) was selected."
        }
        
        let alertController = UIAlertController(title: title, message: text, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        
        presentViewController(alertController, animated: true, completion: nil)
    }
}

