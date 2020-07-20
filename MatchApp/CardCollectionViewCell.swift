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
        
    }
 }
