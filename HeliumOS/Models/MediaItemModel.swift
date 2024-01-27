//
//  MediaItemModel.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 29/03/2020.
//  Copyright © 2020 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation

struct MediaItemModel: MediaItemProtocol {
    let id: String
    
    let title: String
    let genres: [String]
    let type: MediaType
    
    let heroTitle: String?
    let backgroundMediaPath: String?
    let tileImagePath: String?
    
    var formattedGenres: String { genres.joined(separator: ", ") }
}

// TODO: Move

struct GameMediaItemModel {
    let id = UUID().uuidString
    
    let title: String
    let genreTypes: [GameGenreType]
    let type: MediaType = .game
    
    let heroTitle: String?
    let backgroundMediaPath: String?
    let tileImagePath: String?
}

extension GameMediaItemModel {
    var asMediaItemModel: MediaItemModel {
        .init(
            id: id,
            title: title,
            genres: genreTypes.map(\.title),
            type: type,
            heroTitle: heroTitle,
            backgroundMediaPath: backgroundMediaPath,
            tileImagePath: tileImagePath
        )
    }
}

// TODO: Move

struct MusicMediaItemModel {
    let id = UUID().uuidString
    
    let title: String
    let genreTypes: [MusicGenreType]
    let type: MediaType = .music
    
    let heroTitle: String?
    let backgroundMediaPath: String?
    let tileImagePath: String?
}

extension MusicMediaItemModel {
    var asMediaItemModel: MediaItemModel {
        .init(
            id: id,
            title: title,
            genres: genreTypes.map(\.title),
            type: type,
            heroTitle: heroTitle,
            backgroundMediaPath: backgroundMediaPath,
            tileImagePath: tileImagePath
        )
    }
}

// TODO: Move

struct MovieMediaItemModel {
    let id = UUID().uuidString
    
    let title: String
    let genreTypes: [MovieGenreType]
    let type: MediaType = .movie
    
    let heroTitle: String?
    let backgroundMediaPath: String?
    let tileImagePath: String?
}

extension MovieMediaItemModel {
    var asMediaItemModel: MediaItemModel {
        .init(
            id: id,
            title: title,
            genres: genreTypes.map(\.title),
            type: type,
            heroTitle: heroTitle,
            backgroundMediaPath: backgroundMediaPath,
            tileImagePath: tileImagePath
        )
    }
}
