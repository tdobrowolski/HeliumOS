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

struct MediaGenerator {
    
    func getMediaContent(for menuType: MenuItemType) -> [MediaItemModel] {
        
        // Function should return media based on menuType
        
        var mediaContentArray = [MediaItemModel]()
        
        mediaContentArray.append(MediaItemModel(title: "Cyberpunk 2077", genres: ["Action", "RPG"], mediaType: .game, largeTitle: "Discover Unexpected in 2077", backgroundMediaPath: "", tileImagePath: ""))
        
        return mediaContentArray
    }
    
}
