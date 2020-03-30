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
        MediaItemModel(title: "Cyberpunk 2077", genres: ["Action", "RPG"], mediaType: .game, largeTitle: "Discover Unexpected in 2077", backgroundMediaPath: "", tileImagePath: ""),
        MediaItemModel(title: "Future Nostalgia by Dua Lipa", genres: ["Pop", "Dance"], mediaType: .music, largeTitle: "Get on the dancefloor", backgroundMediaPath: "", tileImagePath: ""),
        MediaItemModel(title: "Resident Evil 3", genres: ["Horror", "Survival"], mediaType: .game, largeTitle: "Fight your way to freedom", backgroundMediaPath: "", tileImagePath: ""),
        MediaItemModel(title: "Control", genres: ["Action", "Adventure"], mediaType: .game, largeTitle: "Unleash your hidden powers", backgroundMediaPath: "", tileImagePath: ""),
        MediaItemModel(title: "Star Wars: The Rise of Skywalker", genres: ["Sci-Fi", "Action"], mediaType: .movie, largeTitle: "No one's ever really gone", backgroundMediaPath: "", tileImagePath: ""),
        MediaItemModel(title: "Once Upon a Time... in Hollywood", genres: ["Drama", "Thriller"], mediaType: .movie, largeTitle: "Welcome to 1969 Los Angeles", backgroundMediaPath: "", tileImagePath: ""),
        MediaItemModel(title: "Doom Eternal", genres: ["Action", "Shooter"], mediaType: .game, largeTitle: "Burn the hell", backgroundMediaPath: "", tileImagePath: "")]
    
    func updateMediaContent(for menuType: MenuItemType) -> [MediaItemModel] {
        
        // Work in progress
        // TODO: Function should return media based on menuType
        
        var mediaContentArray = [MediaItemModel]()
        
        mediaContentArray.append(MediaItemModel(title: "Cyberpunk 2077", genres: ["Action", "RPG"], mediaType: .game, largeTitle: "Discover Unexpected in 2077", backgroundMediaPath: "", tileImagePath: ""))
        
        return mediaContentArray
    }
    
}
