//
//  TeamTableViewCell.swift
//  TableViewExample
//
//  Created by CursoIOS on 7/8/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import UIKit

class TeamTableViewCell: UITableViewCell {

    @IBOutlet private weak var shieldImageView: UIImageView!
    
    @IBOutlet private weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func loadTeam(team: Team) {
        shieldImageView.image = UIImage(named: team.imageName)
        nameLabel.text = team.name
    }

}
