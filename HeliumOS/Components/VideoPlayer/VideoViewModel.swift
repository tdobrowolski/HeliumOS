//
//  VideoViewModel.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/02/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import AVFoundation
import Combine

final class VideoViewModel: ObservableObject {
    let player = AVQueuePlayer()
    var playerLooper: AVPlayerLooper?

    init() {
        setupPlayback()
    }

    func update(with url: URL?) {
        Task {
            if let url {
                let playerItem = AVPlayerItem(url: url)
                player.replaceCurrentItem(with: playerItem)
                playerLooper = .init(player: player, templateItem: playerItem)
                play()
            } else {
                player.removeAllItems()
                playerLooper = nil
                pause()
            }
        }
    }

    func play() {
        player.play()
    }

    func pause() {
        player.pause()
    }

    private func setupPlayback() {
        player.isMuted = true
        player.allowsExternalPlayback = false
    }
}
