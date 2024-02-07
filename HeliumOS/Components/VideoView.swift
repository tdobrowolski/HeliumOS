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

final class PlayerContainerView: UIView {
    override class var layerClass: AnyClass {
        AVPlayerLayer.self
    }

    var player: AVPlayer? {
        get { playerLayer.player }
        set { playerLayer.player = newValue }
    }

    // TODO: Check if needed
    var isReadyForDisplay: Bool {
        playerLayer.isReadyForDisplay
    }

    private var playerLayer: AVPlayerLayer {
        layer as! AVPlayerLayer
    }

    init(player: AVPlayer) {
        super.init(frame: .zero)
        self.player = player

        setupPlayerLayer()
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
    let player = AVPlayer()

    func update(with url: URL) {
        player.replaceCurrentItem(with: .init(url: url))
        play()
    }

    func play() {
        player.play()
    }

    func pause() {
        player.pause()
    }
}
