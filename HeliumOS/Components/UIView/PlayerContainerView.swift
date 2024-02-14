//
//  PlayerContainerView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/02/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import AVFoundation
import Combine
import UIKit

protocol PlayerContainerViewDelegate {
    func isReadyForDisplayDidChange(isReadyToDisplay: Bool)
}

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

    var delegate: PlayerContainerViewDelegate?

    var cancellable: Cancellable?

    init(player: AVPlayer) {
        super.init(frame: .zero)
        self.player = player

        setupPlayerLayer()
        bind()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func bind() {
        cancellable = playerLayer.publisher(for: \.isReadyForDisplay)
            .sink() { [weak self] in
                self?.delegate?.isReadyForDisplayDidChange(isReadyToDisplay: $0)
            }
    }

    private func setupPlayerLayer() {
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.contentsGravity = .resizeAspectFill
        playerLayer.backgroundColor = UIColor.clear.cgColor

        backgroundColor = .clear
    }
}
