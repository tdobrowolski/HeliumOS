//
//  MusicMediaItemModel.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 15/02/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct MusicMediaItemModel {
    let id = UUID().uuidString

    let title: String
    let genreTypes: [MusicGenreType]
    let type: MediaType = .music

    let heroTitle: String?

    let tileImage: ImageResource
    let heroImage: ImageResource
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
