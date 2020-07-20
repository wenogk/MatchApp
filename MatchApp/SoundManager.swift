//
//  SoundManager.swift
//  MatchApp
//
//  Created by Romeno Wenogk Fernando on 21/07/2020.
//  Copyright © 2020 Romeno Wenogk Fernando. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    var audioPlayer: AVAudioPlayer?;
    
    enum SoundEffect {
        case flip
        case match
        case nomatch
        case shuffle
    }
    
    func playSound(effect: SoundEffect) {
        var soundFileName = "";
        switch effect {
            case .flip:
                soundFileName = "cardflip"
            case .match:
                soundFileName = "dingcorrect"
            case .nomatch:
                soundFileName = "dingwrong"
            case . shuffle:
                soundFileName = "shuffle"
        }
        
        let bundlePath = Bundle.main.path(forResource: soundFileName, ofType: ".wav")
        
        guard bundlePath != nil else {
            return;
        }
        
        let url = URL(fileURLWithPath: bundlePath!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("audioPlayer error")
        }
        
        
        
        
    }
}
