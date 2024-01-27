//
//  MediaType.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 27/01/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

enum MediaType {
    case game
    case movie
    case music
    case announcement
    case event
    
    var actionTitle: String {
        switch self {
        case .game: return "Launch game"
        case .movie: return "Watch movie"
        case .music: return "Stream album"
        case .announcement, .event: return "Read more"
        }
    }
}
