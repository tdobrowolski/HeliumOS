//
//  UIAudioService.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 29/03/2020.
//  Copyright © 2020 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation
import AVFoundation

/// This singleton can work wrong.
/// If it deallocates object too fast the voice won't play.
/// Needs check!
struct UIAudioService {
    
    enum SoundActionType: String {
        case startup = "startup.mp3"
        case select = "select.mp3"
        case changeSelection = "changeSelection.mp3"
    }
    
    static let shared = UIAudioService()
    private var soundPlayer: AVAudioPlayer?
    
    private init() { }
    
    mutating func playUISound(for soundType: SoundActionType) {
        guard let soundPath = Bundle.main.path(forResource: soundType.rawValue, ofType: nil) else {
            print("🔇 Can't find path for UI sound.")
            return
        }
        let url = URL(fileURLWithPath: soundPath)
        
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.play()
        } catch {
            print("🔇 Error while playing UI sound: \(error.localizedDescription)")
        }
    }
    
}
