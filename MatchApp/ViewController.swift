//
//  ViewController.swift
//  MatchApp
//
//  Created by Romeno Wenogk Fernando on 18/07/2020.
//  Copyright © 2020 Romeno Wenogk Fernando. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    let model = CardModel()
    var cardsArray = [Card]()
    override func viewDidLoad() {
        super.viewDidLoad()
        cardsArray = model.getCards();
        
        // Do any additional setup after loading the view.
        collectionView.dataSource = self;
        collectionView.delegate = self;
    }
    // MARK: - Delegate methods for collection view
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsArray.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell;
        
        
        
        return cell;
    }

}

