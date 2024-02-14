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
                    title: "Alan Wake II",
                    genreTypes: [.survival, .horror],
                    heroTitle: "Monsters wear many faces",
                    tileImage: .init(fileExtension: .jpg, fileName: "AlanWakeIISquare"),
                    heroImage: .init(fileExtension: .jpg, fileName: "AlanWakeIILarge"),
                    heroVideo: nil
                ).asMediaItemModel,
                GameMediaItemModel(
                    title: "Resident Evil 4",
                    genreTypes: [.survival, .horror],
                    heroTitle: "Groundbreaking classic is back",
                    tileImage: .init(fileExtension: .jpg, fileName: "ResidentEvil4Square"),
                    heroImage: .init(fileExtension: .jpg, fileName: "ResidentEvil4Large"),
                    heroVideo: nil
                ).asMediaItemModel,
                MusicMediaItemModel(
                    title: "Hyperdrama by Justice",
                    genreTypes: [.electronic, .synthcore],
                    heroTitle: "Go with the flow",
                    tileImage: .init(fileExtension: .jpg, fileName: "JusticeSquare"),
                    heroImage: .init(fileExtension: .jpg, fileName: "JusticeLarge"),
                    heroVideo: nil
                ).asMediaItemModel,
                GameMediaItemModel(
                    title: "Star Wars: Outlaws",
                    genreTypes: [.action, .adventure],
                    heroTitle: "In a Galaxy Far, Far Away...",
                    tileImage: .init(fileExtension: .jpeg, fileName: "StarWarsOutlawsSquare"),
                    heroImage: .init(fileExtension: .jpg, fileName: "StarWarsOutlawsLarge"),
                    heroVideo: nil
                ).asMediaItemModel,
                GameMediaItemModel(
                    title: "Grand Theft Auto VI",
                    genreTypes: [.action, .adventure],
                    heroTitle: "Welcome to Leonida",
                    tileImage: .init(fileExtension: .jpg, fileName: "GTAVISquare"),
                    heroImage: .init(fileExtension: .jpg, fileName: "GTAVILarge"),
                    heroVideo: nil
                ).asMediaItemModel,
                MovieMediaItemModel(
                    title: "Dune: Part Two",
                    genreTypes: [.action, .adventure],
                    heroTitle: "Explore the mythic journey",
                    tileImage: .init(fileExtension: .jpg, fileName: "DuneSquare"),
                    heroImage: .init(fileExtension: .jpg, fileName: "DuneLarge"),
                    heroVideo: nil
                ).asMediaItemModel,
                MusicMediaItemModel(
                    title: "Random Access Memories by Daft Punk",
                    genreTypes: [.house, .funk, .techno],
                    heroTitle: "Icons of the Electro-Funk",
                    tileImage: .init(fileExtension: .jpg, fileName: "DaftPunkSquare"),
                    heroImage: .init(fileExtension: .jpg, fileName: "DaftPunkLarge2"),
                    heroVideo: nil
                ).asMediaItemModel,
                MovieMediaItemModel(
                    title: "Oppenheimer",
                    genreTypes: [.crime, .thriller],
                    heroTitle: "Oscar-winning masterpiece",
                    tileImage: .init(fileExtension: .jpg, fileName: "OppenheimerSquare"),
                    heroImage: .init(fileExtension: .jpg, fileName: "OppenheimerLarge"),
                    heroVideo: nil
                ).asMediaItemModel,
                MovieMediaItemModel(
                    title: "Spider-Man: Across the Spider-Verse",
                    genreTypes: [.animation, .adventure],
                    heroTitle: "Discover Unexpected in the Spider-Verse",
                    tileImage: .init(fileExtension: .jpg, fileName: "SpiderManSquare"),
                    heroImage: .init(fileExtension: .jpg, fileName: "SpiderManLarge"),
                    heroVideo: nil
                ).asMediaItemModel,
                GameMediaItemModel(
                    title: "Mortal Kombat 1",
                    genreTypes: [.fighting],
                    heroTitle: "It's in our blood",
                    tileImage: .init(fileExtension: .jpg, fileName: "MortalKombat1Square"),
                    heroImage: .init(fileExtension: .jpg, fileName: "MortalKombat1Large3"),
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
                    heroVideo: .init(fileExtension: .mp4, fileName: "test")
                ).asMediaItemModel
            ]
        )
    }
}

// TODO: Remove unused assets
