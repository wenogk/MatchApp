//
//  ViewController.swift
//  MatchApp
//
//  Created by Romeno Wenogk Fernando on 18/07/2020.
//  Copyright © 2020 Romeno Wenogk Fernando. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    let model = CardModel()
    var cardsArray = [Card]()
    var firstFlippedCardIndex: IndexPath?;
    var timer:Timer?;
    var milliseconds:Int = 20000;
    var soundPlayer: SoundManager = SoundManager();
    override func viewDidLoad() {
        super.viewDidLoad()
        cardsArray = model.getCards();
        
        // Do any additional setup after loading the view.
        collectionView.dataSource = self;
        collectionView.delegate = self;
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerFired), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        soundPlayer.playSound(effect: .shuffle)
    }
    
    // MARK: - Timer methods
    @objc func timerFired() {
        milliseconds -= 1;
        
        let seconds:Double = Double(milliseconds)/1000.0
        TimerLabel.text = "Remaining time: \(String(format: "%.2f", seconds))";
        
        if milliseconds == 0 {
            timer?.invalidate()
            TimerLabel.textColor = UIColor.red;
            TimerLabel.text = "Time up!";
            checkForGameEnd();
        }
    }
    // MARK: - Delegate methods for collection view
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsArray.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell;
        
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let convertedCell = cell as? CardCollectionViewCell;
        convertedCell?.configureCell(card: cardsArray[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell;
        
        if cell?.card?.isFlipped == false && cell?.card?.isMatched == false {
            cell?.flipUp();
            soundPlayer.playSound(effect: .flip)
            
            if(firstFlippedCardIndex == nil) {
                firstFlippedCardIndex = indexPath;
            } else {
                checkForMatch(indexPath)
            }
            
        }
        
        
    }
    
    
    // MARK: - Game logic methods
    
    func checkForMatch(_ secondFlippedCardIndex: IndexPath) {
        let cardOne = cardsArray[firstFlippedCardIndex!.row];
        let cardTwo = cardsArray[secondFlippedCardIndex.row];
        let cardOneCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        let cardTwoCell = collectionView.cellForItem(at: secondFlippedCardIndex) as? CardCollectionViewCell
        //compare the cards
        if cardOne.imageName == cardTwo.imageName {
            cardOne.isMatched = true;
            cardTwo.isMatched = true;
            soundPlayer.playSound(effect: .match)
            cardOneCell?.remove()
            cardTwoCell?.remove()
            checkForGameEnd()
        } else {
            soundPlayer.playSound(effect: .nomatch)
            cardOneCell?.flipDown()
            cardTwoCell?.flipDown()
        }
        
        firstFlippedCardIndex = nil;
    }
    
    func checkForGameEnd() {
        var won:Bool = true;
        for card in cardsArray {
            if !card.isMatched {
                won = false;
                break;
            }
        }
        if won {
            showAlert(title:"Congrats.",msg:"You won!");
        } else {
            if(milliseconds<=0) {
                showAlert(title:"Time.",msg:"Ran out of time boi!");
            }
        }
    }
    
    func showAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
}

