//
//  ContentView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 23/03/2020.
//  Copyright © 2020 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            backgroundView
            mainContentView
        }
    }
    
    private var backgroundView: some View {
        BackgroundView(activeItem: $viewModel.activeItem)
            .edgesIgnoringSafeArea(.all)
    }
    
    private var mainContentView: some View {
        VStack(spacing: 0) {
            NavigationBarView(currentTime: viewModel.clockService.currentTime)
                .padding([.top, .trailing], 60.0)
                .padding([.bottom, .leading], 75.0)
            Spacer()
            ItemDetailsView(activeItem: viewModel.activeItem)
                .padding([.leading, .trailing], 75.0)
            MainTilesListView(activeItem: $viewModel.activeItem, mediaItems: viewModel.mediaItems)
        }
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let viewModel = MainViewModel()
    
    static var previews: some View {
        ContentView(viewModel: viewModel)
            .previewDevice(.init(rawValue: "iPad8,1"))
            .previewDisplayName("iPad Pro")
            .previewLayout(.fixed(width: 1194.0, height: 834.0))
    }
}

final class MainViewModel: ObservableObject {
    @Published var activeItem: MediaItemModel?
    
    let clockService = LiveClockService()
    
    init() {
        setInitialActiveItem()
    }
    
    var mediaItems = [
        MediaItemModel(title: "Cyberpunk 2077", genres: ["Action", "RPG"], mediaType: .game, largeTitle: "Discover Unexpected in 2077", backgroundMediaPath: "Cyberpunk2077Large", tileImagePath: "Cyberpunk2077Square"),
        MediaItemModel(title: "Future Nostalgia by Dua Lipa", genres: ["Pop", "Dance"], mediaType: .music, largeTitle: "Get on the dancefloor", backgroundMediaPath: "FutureNostalgiaLarge", tileImagePath: "FutureNostalgiaSquare"),
        MediaItemModel(title: "Resident Evil 3", genres: ["Horror", "Survival"], mediaType: .game, largeTitle: "Fight your way to freedom", backgroundMediaPath: "ResidentEvil3Large", tileImagePath: "ResidentEvil3Square"),
        MediaItemModel(title: "Control", genres: ["Action", "Adventure"], mediaType: .game, largeTitle: "Unleash your hidden powers", backgroundMediaPath: "ControlLarge", tileImagePath: "ControlSquare"),
        MediaItemModel(title: "Jurassic World: Fallen Kingdom", genres: ["Sci-Fi", "Action"], mediaType: .movie, largeTitle: "Welcome to Jurassic Park", backgroundMediaPath: "JurassicWorldFallenKingdomLarge", tileImagePath: "JurassicWorldFallenKingdomSquare"),
        MediaItemModel(title: "Knives Out", genres: ["Crime", "Thriller"], mediaType: .movie, largeTitle: "Everyone is a suspect", backgroundMediaPath: "KnivesOutLarge", tileImagePath: "KnivesOutSquare"),
        MediaItemModel(title: "Doom Eternal", genres: ["Action", "Shooter"], mediaType: .game, largeTitle: "Burn the Hell", backgroundMediaPath: "DoomEternalLarge", tileImagePath: "DoomEternalSquare")]
        
    private func setInitialActiveItem() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.activeItem = self?.mediaItems.first
        }
    }
}
