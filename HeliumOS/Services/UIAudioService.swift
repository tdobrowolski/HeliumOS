//
//  UIAudioService.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 29/03/2020.
//  Copyright © 2020 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation
import AVFoundation

enum SoundActionType: String {
    case startup = "startup.wav"
    case select = "select.wav"
    case changeSelection = "changeSelection.wav"
}

final class UIAudioService {
    static let shared = UIAudioService()

    private init() { }
    
    var soundPlayer: AVAudioPlayer?
    
    func playUISound(for soundType: SoundActionType) {
//        guard let soundPath = Bundle.main.path(forResource: soundType.rawValue, ofType: nil) else {
//            return print("🔇 Can't find path for UI sound.")
//        }
//        
//        let url = URL(fileURLWithPath: soundPath)
//        
//        do {
//            soundPlayer = try AVAudioPlayer(contentsOf: url)
//            soundPlayer?.play()
//        } catch {
//            print("🔇 Error while playing UI sound: \(error.localizedDescription)")
//        }
    }
}
