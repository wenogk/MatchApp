//
//  CardModel.swift
//  MatchApp
//
//  Created by Romeno Wenogk Fernando on 18/07/2020.
//  Copyright © 2020 Romeno Wenogk Fernando. All rights reserved.
//

import Foundation


class CardModel{
    func getCards()  -> [Card]  {
        
        var generatedCards = [Card]();
        var usedNumbers = [Int]();
        for _ in 1...8 {
            
            var randomNumber = Int.random(in: 1...13);
            while(usedNumbers.contains(randomNumber)) {
                randomNumber = Int.random(in: 1...13);
            }
            usedNumbers.append(randomNumber);
            
            let cardOne = Card();
            let cardTwo = Card();
            
            cardOne.imageName = "card\(randomNumber)"
            cardTwo.imageName = "card\(randomNumber)"
            
            generatedCards += [cardOne, cardTwo]
            
            print(randomNumber)
        }
        
        generatedCards.shuffle();
        return generatedCards;
        
        
    }
}
