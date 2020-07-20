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
            flipDown(0)
        }
        
    }
    
    func flipUp(_ duration : TimeInterval = 0.3) {
        
        //flip up animation
        UIView.transition(from: backImageView, to: frontImageView, duration: duration, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil);
        
        //set the status of the card
        card?.isFlipped = true;
        
    }
    
    func flipDown(_ duration : TimeInterval = 0.3) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: duration, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil);
        })
        
        
        card?.isFlipped = false;
    }
    
    func remove() {
        backImageView.alpha = 0;
        
        UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseOut, animations: {
            self.frontImageView.alpha = 0;
        }, completion: nil)
    }
    
 }
