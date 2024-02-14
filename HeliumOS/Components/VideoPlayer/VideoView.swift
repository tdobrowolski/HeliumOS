//
//  VideoView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 06/02/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import AVFoundation
import SwiftUI

struct VideoView: UIViewRepresentable {
    class PlayerContainerViewCoordinator: NSObject, PlayerContainerViewDelegate {
        var parent: VideoView

        init(_ parent: VideoView) {
            self.parent = parent
        }

        func isReadyForDisplayDidChange(isReadyToDisplay: Bool) {
            parent.isReadyToPlay = isReadyToDisplay
        }
    }

    @Binding private var isReadyToPlay: Bool

    let player: AVPlayer

    init(
        player: AVPlayer,
        isReadyToPlay: Binding<Bool>
    ) {
        self.player = player
        _isReadyToPlay = isReadyToPlay
    }

    func makeUIView(context: Context) -> PlayerContainerView {
        let playerContainerView = PlayerContainerView(player: player)
        playerContainerView.delegate = context.coordinator

        return playerContainerView
    }

    func updateUIView(_ uiView: PlayerContainerView, context: Context) {}

    func makeCoordinator() -> PlayerContainerViewCoordinator {
        PlayerContainerViewCoordinator(self)
    }
}
