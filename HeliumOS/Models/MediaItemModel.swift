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

    let tileImage: VisualContentModel
    let heroImage: VisualContentModel
    let heroVideo: VisualContentModel?

    var formattedGenres: String { genres.joined(separator: ", ") }
}

// TODO: Move

enum FileExtension: String {
    case mp4
    case jpeg
    case jpg
    case png // TODO: Avoid in future and remove

    var value: String {
        rawValue
    }
}

struct VisualContentModel: Equatable {
    let fileExtension: FileExtension
    let fileName: String

    var url: URL? {
        Bundle.main.url(
            forResource: fileName,
            withExtension: fileExtension.value
        )
    }
}

// TODO: Move

struct GameMediaItemModel {
    let id = UUID().uuidString
    
    let title: String
    let genreTypes: [GameGenreType]
    let type: MediaType = .game
    
    let heroTitle: String?

    let tileImage: VisualContentModel
    let heroImage: VisualContentModel
    let heroVideo: VisualContentModel?
}

extension GameMediaItemModel {
    var asMediaItemModel: MediaItemModel {
        .init(
            id: id,
            title: title,
            genres: genreTypes.map(\.title),
            type: type,
            heroTitle: heroTitle,
            tileImage: tileImage,
            heroImage: heroImage,
            heroVideo: heroVideo
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

    let tileImage: VisualContentModel
    let heroImage: VisualContentModel
    let heroVideo: VisualContentModel?
}

extension MusicMediaItemModel {
    var asMediaItemModel: MediaItemModel {
        .init(
            id: id,
            title: title,
            genres: genreTypes.map(\.title),
            type: type,
            heroTitle: heroTitle,
            tileImage: tileImage,
            heroImage: heroImage,
            heroVideo: heroVideo
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

    let tileImage: VisualContentModel
    let heroImage: VisualContentModel
    let heroVideo: VisualContentModel?
}

extension MovieMediaItemModel {
    var asMediaItemModel: MediaItemModel {
        .init(
            id: id,
            title: title,
            genres: genreTypes.map(\.title),
            type: type,
            heroTitle: heroTitle,
            tileImage: tileImage,
            heroImage: heroImage,
            heroVideo: heroVideo
        )
    }
}
