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
    var firstFlippedCardIndex: IndexPath?;
    
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
        
        cell.configureCell(card: cardsArray[indexPath.row]);
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell;
        
        if cell?.card?.isFlipped == false {
                cell?.flipUp();
            
            if(firstFlippedCardIndex == nil) {
                firstFlippedCardIndex = indexPath;
            } else {
                
            }
            
            }
        
        
    }
    // MARK: - Game logic methods
    func checkForMatch(_ secondFlippedCardIndex: IndexPath) {
        let cardOne = cardsArray[firstFlippedCardIndex!.row];
        let cardTwo = cardsArray[secondFlippedCardIndex.row];
        
        //compare the cards
        if cardOne.imageName == cardTwo.imageName {
            
        } else {
            
        }
        
        firstFlippedCardIndex = nil;
    }

}

