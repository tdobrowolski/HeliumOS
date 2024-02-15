//
//  MovieMediaItemModel.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 15/02/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct MovieMediaItemModel {
    let id = UUID().uuidString

    let title: String
    let genreTypes: [MovieGenreType]
    let type: MediaType = .movie

    let heroTitle: String?

    let tileImage: ImageResource
    let heroImage: ImageResource
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
