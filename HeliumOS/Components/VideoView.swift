//
//  VideoView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 06/02/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import AVFoundation
import UIKit
import SwiftUI

// MARK: UIKit View

import Combine

final class PlayerContainerView: UIView {
    override class var layerClass: AnyClass {
        AVPlayerLayer.self
    }

    var player: AVPlayer? {
        get { playerLayer.player }
        set { playerLayer.player = newValue }
    }

    private var playerLayer: AVPlayerLayer {
        layer as! AVPlayerLayer
    }

    var cancellable: Cancellable?

    init(player: AVPlayer) {
        super.init(frame: .zero)
        self.player = player

        setupPlayerLayer()
        cancellable = playerLayer.publisher(for: \.isReadyForDisplay)
            .sink() { [weak self] in
                let date = Date()
                print("\(date.description) - \($0)")
                if $0 {
                    self?.backgroundColor = .green
                } else {
                    self?.backgroundColor = .red
                }
            }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPlayerLayer() {
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.contentsGravity = .resizeAspectFill
        playerLayer.backgroundColor = UIColor.clear.cgColor

        backgroundColor = .clear
    }
}

// MARK: SwiftUI View

struct VideoView: UIViewRepresentable {
    typealias UIViewType = PlayerContainerView

    let player: AVPlayer

    init(player: AVPlayer) {
        self.player = player
    }

    func makeUIView(context: Context) -> PlayerContainerView {
        PlayerContainerView(player: player)
    }

    func updateUIView(_ uiView: PlayerContainerView, context: Context) {}
}

// MARK: ViewModel

final class VideoViewModel: ObservableObject {
    let player = AVQueuePlayer()
    var playerLooper: AVPlayerLooper?

    var isReadyToPlay: Bool {
        player.status == .readyToPlay
    }

    init() {
        setupPlayback()
    }

    func update(with url: URL?) {
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
