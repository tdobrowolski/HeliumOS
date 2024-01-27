//
//  MediaRepository.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 27/01/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import Combine

struct MediaRepository {
    var mainMediaItems: CurrentValueSubject<[MediaItemModel], Never> = .init([])
    
    init() { fetchMainItems() }
    
    private func fetchMainItems() {
        mainMediaItems.send(
            [
                GameMediaItemModel(
                    title: "Cyberpunk 2077",
                    genreTypes: [.action, .rpg],
                    heroTitle: "Discover Unexpected in 2077",
                    backgroundMediaPath: "Cyberpunk2077Large",
                    tileImagePath: "Cyberpunk2077Square"
                ).asMediaItemModel,
                MusicMediaItemModel(
                    title: "Future Nostalgia by Dua Lipa",
                    genreTypes: [.pop, .dance],
                    heroTitle: "Get on the dancefloor",
                    backgroundMediaPath: "FutureNostalgiaLarge",
                    tileImagePath: "FutureNostalgiaSquare"
                ).asMediaItemModel,
                GameMediaItemModel(
                    title: "Resident Evil 3",
                    genreTypes: [.horror, .survival],
                    heroTitle: "Fight your way to freedom",
                    backgroundMediaPath: "ResidentEvil3Large",
                    tileImagePath: "ResidentEvil3Square"
                ).asMediaItemModel,
                GameMediaItemModel(
                    title: "Control",
                    genreTypes: [.action, .adventure],
                    heroTitle: "Unleash your hidden powers",
                    backgroundMediaPath: "ControlLarge",
                    tileImagePath: "ControlSquare"
                ).asMediaItemModel,
                MovieMediaItemModel(
                    title: "Jurassic World: Fallen Kingdom",
                    genreTypes: [.scifi, .action],
                    heroTitle: "Welcome to Jurassic Park",
                    backgroundMediaPath: "JurassicWorldFallenKingdomLarge",
                    tileImagePath: "JurassicWorldFallenKingdomSquare"
                ).asMediaItemModel,
                MovieMediaItemModel(
                    title: "Knives Out",
                    genreTypes: [.crime, .thriller],
                    heroTitle: "Everyone is a suspect",
                    backgroundMediaPath: "KnivesOutLarge",
                    tileImagePath: "KnivesOutSquare"
                ).asMediaItemModel,
                GameMediaItemModel(
                    title: "Doom Eternal",
                    genreTypes: [.action, .shooter],
                    heroTitle: "Burn the Hell",
                    backgroundMediaPath: "DoomEternalLarge",
                    tileImagePath: "DoomEternalSquare"
                ).asMediaItemModel
            ]
        )
    }
}
