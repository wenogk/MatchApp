//
//  CardCollectionViewCell.swift
//  MatchApp
//
//  Created by Romeno Wenogk Fernando on 18/07/2020.
//  Copyright © 2020 Romeno Wenogk Fernando. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:Card?;
    func configureCell(card: Card) {
        
        self.card = card;
        frontImageView.image = UIImage(named: card.imageName)
        
        if card.isFlipped == true {
            flipUp(0)
        } else {
            
        }
        
    }
    
    func flipUp(_ duration : TimeInterval = 0.3) {
        
        //flip up animation
        UIView.transition(from: backImageView, to: frontImageView, duration: duration, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil);
        
    }
    
    func flipDown() {
        
    }
    
 }
