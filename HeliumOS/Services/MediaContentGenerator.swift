//
//  MediaContentGenerator.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 29/03/2020.
//  Copyright © 2020 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation

enum MenuItemType: String {
    case home = "house"
    case games = "gamecontroller"
    case media = "rectangle.on.rectangle.angled"
    case store = "bag"
    case tv = "tv"
    case options = "circle"
    case notifications = "bell"
}

final class MediaGenerator: ObservableObject {
    
    @Published var mediaItems: [MediaItemModel] = [
        MediaItemModel(title: "Cyberpunk 2077", genres: ["Action", "RPG"], mediaType: .game, largeTitle: "Discover Unexpected in 2077", backgroundMediaPath: "Cyberpunk2077Large", tileImagePath: "Cyberpunk2077Square", isDefault: true),
        MediaItemModel(title: "Future Nostalgia by Dua Lipa", genres: ["Pop", "Dance"], mediaType: .music, largeTitle: "Get on the dancefloor", backgroundMediaPath: "FutureNostalgiaLarge", tileImagePath: "FutureNostalgiaSquare"),
        MediaItemModel(title: "Resident Evil 3", genres: ["Horror", "Survival"], mediaType: .game, largeTitle: "Fight your way to freedom", backgroundMediaPath: "ResidentEvil3Large", tileImagePath: "ResidentEvil3Square"),
        MediaItemModel(title: "Control", genres: ["Action", "Adventure"], mediaType: .game, largeTitle: "Unleash your hidden powers", backgroundMediaPath: "ControlLarge", tileImagePath: "ControlSquare"),
        MediaItemModel(title: "Jurassic World: Fallen Kingdom", genres: ["Sci-Fi", "Action"], mediaType: .movie, largeTitle: "Welcome to Jurassic Park", backgroundMediaPath: "JurassicWorldFallenKingdomLarge", tileImagePath: "JurassicWorldFallenKingdomSquare"),
        MediaItemModel(title: "Knives Out", genres: ["Crime", "Thriller"], mediaType: .movie, largeTitle: "Everyone is a suspect", backgroundMediaPath: "KnivesOutLarge", tileImagePath: "KnivesOutSquare"),
        MediaItemModel(title: "Doom Eternal", genres: ["Action", "Shooter"], mediaType: .game, largeTitle: "Burn the Hell", backgroundMediaPath: "DoomEternalLarge", tileImagePath: "DoomEternalSquare")]
    
    func getDefaultItem() -> MediaItemModel? {
        return mediaItems.first
    }
    
    func updateMediaContent(for menuType: MenuItemType) -> [MediaItemModel] {
        
        // Work in progress
        // TODO: Function should return media based on menuType
        
        var mediaContentArray = [MediaItemModel]()
        
        mediaContentArray.append(MediaItemModel(title: "Cyberpunk 2077", genres: ["Action", "RPG"], mediaType: .game, largeTitle: "Discover Unexpected in 2077", backgroundMediaPath: "", tileImagePath: ""))
        
        return mediaContentArray
    }
    
}
