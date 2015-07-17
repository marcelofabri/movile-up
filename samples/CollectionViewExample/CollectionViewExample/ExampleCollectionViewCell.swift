//
//  ExampleCollectionViewCell.swift
//  
//
//  Created by Marcelo Fabri on 17/07/15.
//
//

import UIKit

class ExampleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var cellNumberLabel: UILabel!
    
    static let colors: [UIColor] = [.greenColor(), .purpleColor(),
        .redColor(), .blueColor(), .orangeColor()]
    
    func loadCellNumber(number: Int) {
        cellNumberLabel.text = "Cell #\(number)"
        
        let idx = number % ExampleCollectionViewCell.colors.count
        backgroundColor = ExampleCollectionViewCell.colors[idx]
    }
}
