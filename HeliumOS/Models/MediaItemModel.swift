//
//  MediaItemModel.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 29/03/2020.
//  Copyright © 2020 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation

struct MediaItemModel: Identifiable {
    enum MediaType {
        case game
        case movie
        case music
        case announcement
        case event
        
        var actionTitle: String {
            switch self {
            case .game:
                return "Launch game"
            case .movie:
                return "Watch movie"
            case .music:
                return "Stream album"
            case .announcement, .event:
                return "Read more"
            }
        }
    }
    
    let id = UUID().uuidString
    
    let title: String
    let genres: [String]
    let mediaType: MediaType
    
    let largeTitle: String?
    let backgroundMediaPath: String?
    let tileImagePath: String?
    
    var formattedGenres: String { genres.joined(separator: ", ") }
}
