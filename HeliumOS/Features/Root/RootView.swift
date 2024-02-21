//
//  RootView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 21/02/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

// The project lacks routing and proper dependency management.
// This is only for debug and for fun.

// FIXME: Not happy with the outcome, opacity animation flashes.
// Looks like HomeView is inited before showing (then I miss first tile selection animation).
// With other transition animations it's even worse.

struct RootView: View {
    private let viewModel = RootViewModel()

    @State private var didAppear = false

    var body: some View {
        content
            .ignoresSafeArea()
            .persistentSystemOverlays(.hidden)
            .onAppear {
                withAnimation(
                    .easeOut(duration: 0.6)
                    .delay(AnimationConstants.bootDuration)
                ) {
                    didAppear = true
                }
            }
    }

    @ViewBuilder
    private var content: some View {
        if didAppear {
            homeView
                .transition(.opacity)
        } else {
            bootView
        }
    }

    private var bootView: BootView {
        BootView()
    }

    private var homeView: HomeView {
        HomeView(viewModel: viewModel.homeViewModel)
    }
}
