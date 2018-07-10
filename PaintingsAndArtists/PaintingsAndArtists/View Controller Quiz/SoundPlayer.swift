//
//  SoundPlayer.swift
//  PaintingsAndArtists
//
//  Created by Normand Martin on 2018-06-24.
//  Copyright © 2018 Normand Martin. All rights reserved.
//

import Foundation
import AVFoundation
class SoundPlayer {
    var player: AVAudioPlayer?
    func playSound(soundName: String, type: String) {
        
        let path = Bundle.main.path(forResource: soundName, ofType: type)!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            // couldn't load file :(
        }
        
    }
    func stopSound() {
        player?.stop()
    }
    
}
