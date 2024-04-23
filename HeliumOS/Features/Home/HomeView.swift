//
//  HomeView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 23/03/2020.
//  Copyright © 2020 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        mainContentView
            .background { backgroundView }
            .persistentSystemOverlays(.hidden)
    }
    
    private var mainContentView: some View {
        VStack(spacing: 0.0) {
            navigationBar
            Spacer()
            VStack(spacing: 40.0) {
                selectedItemDetails
                itemsList
            }
        }
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }
    
    private var navigationBar: some View {
        NavigationView(
            currentTime: $viewModel.currentTime,
            selectedMenuItem: $viewModel.selectedMenuItem,
            currentControllerInputSymbols: $viewModel.currentControllerInputSymbols
        )
        .padding(
            [.leading, .top, .trailing],
            MainLayoutConstants.safeAreaPadding
        )
    }
    
    private var backgroundView: some View {
        BackgroundView(
            activeItem: $viewModel.selectedItem,
            items: $viewModel.mediaItems
        )
        .edgesIgnoringSafeArea(.all)
        .overlay {
            videoPlayer
                .opacity(viewModel.isReadyToPlay ? 1.0 : 0.0)
                .animation(.easeOut(duration: 0.6), value: viewModel.isReadyToPlay)
        }
    }
    
    private var selectedItemDetails: some View {
        ItemDetailsView(
            selectedItem: $viewModel.selectedItem,
            currentControllerInputSymbols: $viewModel.currentControllerInputSymbols
        )
            .padding(.horizontal, MainLayoutConstants.safeAreaPadding)
    }
    
    private var itemsList: some View {
        MainTilesListView(
            activeItem: $viewModel.selectedItem,
            mediaItems: $viewModel.mediaItems
        )
        .padding(.bottom, MainLayoutConstants.safeAreaPadding)
    }

    private var videoPlayer: some View {
        VideoView(
            player: viewModel.videoViewModel.player,
            isReadyToPlay: .init(
                get: { viewModel.isReadyToPlay },
                set: { viewModel.isReadyToPlay = $0 }
            )
        )
        .ignoresSafeArea()
    }
}

#Preview("iPad Pro") {
    HomeView(viewModel: HomeViewModel())
}
