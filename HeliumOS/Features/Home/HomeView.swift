//
//  HomeView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 23/03/2020.
//  Copyright © 2020 Tobiasz Dobrowolski. All rights reserved.
//

import AVKit // TODO: Remove if not needed
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        mainContentView
            .background { videoPlayer } //backgroundView }
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
            selectedMenuItem: $viewModel.selectedMenuItem
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
    }
    
    private var selectedItemDetails: some View {
        ItemDetailsView(selectedItem: viewModel.selectedItem)
            .padding(.horizontal, MainLayoutConstants.safeAreaPadding)
    }
    
    private var itemsList: some View {
        MainTilesListView(
            activeItem: $viewModel.selectedItem,
            mediaItems: $viewModel.mediaItems
        )
        .padding(.bottom, MainLayoutConstants.safeAreaPadding)
    }

    // MARK: Debug video player
    private let avPlayer = AVPlayer(
        url: .init(resource: .init(name: "test.mp4"))!
    )

    // TODO: Use custom VideoPlayer from UIKit
    private var videoPlayer: some View {
        VideoPlayer(player: avPlayer)
            .ignoresSafeArea()
            .onAppear { setupAVPlayer() }
    }

    private func setupAVPlayer() {
        avPlayer.isMuted = true
        avPlayer.play()
    }
}

struct ContentView_Previews: PreviewProvider {
    static let viewModel = HomeViewModel()
    
    static var previews: some View {
        HomeView(viewModel: viewModel)
            .previewDevice(.init(rawValue: "iPad8,1"))
            .previewDisplayName("iPad Pro")
            .previewLayout(.fixed(width: 1194.0, height: 834.0))
    }
}
