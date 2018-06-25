//
//  SoundManager.swift
//  Matching
//
//  Created by Jordan on 2018-06-24.
//  Copyright © 2018 Jordan. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    static var audioPlayer:AVAudioPlayer?
    
    enum SoundEffect {
        case cardflip
        case shuffle
        case match
        case nomatch
    }
    
    static func playSound(effect:SoundEffect) {
        var soundFilename = ""
        
        // Determine which sound effect we want to play
        // And set the appropriate filename
        switch effect {
            
        case .cardflip:
            soundFilename = "cardflip"
        case .shuffle:
            soundFilename = "shuffle"
        case .match:
            soundFilename = "dingcorrect"
        case .nomatch:
            soundFilename = "dingwrong"
        }
        
        let bundlePath = Bundle.main.path(forResource: soundFilename, ofType: "wav")
        
        guard bundlePath != nil else {
            print("Could not find sound file \(soundFilename)")
            return
        }
        
        // Create a URL object from this string path
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        do {
            // Create audio player object
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            // Play the sound
            audioPlayer?.play()
        }
        catch {
            // Could not create audio object, log the error
            print("Could not create the audio player object for sound file \(soundFilename)")
        }
    }
}
