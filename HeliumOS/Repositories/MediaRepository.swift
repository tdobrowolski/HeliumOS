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
                    tileImage: .init(fileExtension: .jpg, fileName: "Cyberpunk2077Square"),
                    heroImage: .init(fileExtension: .png, fileName: "Cyberpunk2077Large"),
                    heroVideo: nil
                ).asMediaItemModel,
                MusicMediaItemModel(
                    title: "Future Nostalgia by Dua Lipa",
                    genreTypes: [.pop, .dance],
                    heroTitle: "Get on the dancefloor",
                    tileImage: .init(fileExtension: .jpg, fileName: "FutureNostalgiaSquare"),
                    heroImage: .init(fileExtension: .jpeg, fileName: "FutureNostalgiaLarge"),
                    heroVideo: nil
                ).asMediaItemModel,
                GameMediaItemModel(
                    title: "Resident Evil 3",
                    genreTypes: [.horror, .survival],
                    heroTitle: "Fight your way to the freedom",
                    tileImage: .init(fileExtension: .jpeg, fileName: "ResidentEvil3Square"),
                    heroImage: .init(fileExtension: .jpg, fileName: "ResidentEvil3Large"),
                    heroVideo: nil
                ).asMediaItemModel,
                GameMediaItemModel(
                    title: "Control",
                    genreTypes: [.action, .adventure],
                    heroTitle: "Unleash your hidden powers",
                    tileImage: .init(fileExtension: .jpg, fileName: "ControlSquare"),
                    heroImage: .init(fileExtension: .jpeg, fileName: "ControlLarge"),
                    heroVideo: nil
                ).asMediaItemModel,
                MovieMediaItemModel(
                    title: "Jurassic World: Fallen Kingdom",
                    genreTypes: [.scifi, .action],
                    heroTitle: "Welcome to the Jurassic Park",
                    tileImage: .init(fileExtension: .jpg, fileName: "JurassicWorldFallenKingdomSquare"),
                    heroImage: .init(fileExtension: .jpg, fileName: "JurassicWorldFallenKingdomLarge"),
                    heroVideo: nil
                ).asMediaItemModel,
                MovieMediaItemModel(
                    title: "Knives Out",
                    genreTypes: [.crime, .thriller],
                    heroTitle: "Everyone is a suspect",
                    tileImage: .init(fileExtension: .jpg, fileName: "KnivesOutSquare"),
                    heroImage: .init(fileExtension: .jpg, fileName: "KnivesOutLarge"),
                    heroVideo: nil
                ).asMediaItemModel,
                GameMediaItemModel(
                    title: "Doom Eternal",
                    genreTypes: [.action, .shooter],
                    heroTitle: "Burn the Hell",
                    tileImage: .init(fileExtension: .jpeg, fileName: "DoomEternalSquare"),
                    heroImage: .init(fileExtension: .jpg, fileName: "DoomEternalLarge"),
                    heroVideo: nil
                ).asMediaItemModel
            ]
        )
    }
}
