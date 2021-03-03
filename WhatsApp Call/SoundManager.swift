//
//  SoundManager.swift
//  WhatsApp Call
//
//  Created by Agus Cahyono on 03/03/21.
//

import AVFoundation

class SoundManager {
    
    static var audioPlayer: AVAudioPlayer?
    
    static func playSounds(soundfile: String) {
        if let path = Bundle.main.path(forResource: soundfile, ofType: nil){
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
                audioPlayer?.numberOfLoops = 100
            } catch {
                print("Error")
            }
        }
    }
    
    static func stopSound() {
        audioPlayer?.stop()
    }
}
