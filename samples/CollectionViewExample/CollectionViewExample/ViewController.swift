//
//  ViewController.swift
//  CollectionViewExample
//
//  Created by Marcelo Fabri on 17/07/15.
//  Copyright (c) 2015 Movile. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(Reusable.Cell, forIndexPath: indexPath) as! ExampleCollectionViewCell
        
        cell.loadCellNumber(indexPath.item)
        
        return cell
    }
}

