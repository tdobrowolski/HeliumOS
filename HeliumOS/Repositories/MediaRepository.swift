//
//  MediaRepository.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 27/01/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import Combine
import SwiftUI

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
                    tileImage: .alanWakeIISquare,
                    heroImage: .alanWakeIILarge,
                    heroVideo: nil
                ).asMediaItemModel,
                GameMediaItemModel(
                    title: "Resident Evil 4",
                    genreTypes: [.survival, .horror],
                    heroTitle: "Groundbreaking classic is back",
                    tileImage: .residentEvil4Square,
                    heroImage: .residentEvil4Large,
                    heroVideo: nil
                ).asMediaItemModel,
                MusicMediaItemModel(
                    title: "Hyperdrama by Justice",
                    genreTypes: [.electronic, .synthcore],
                    heroTitle: "Go with the flow",
                    tileImage: .justiceSquare,
                    heroImage: .justiceLarge,
                    heroVideo: .init(fileExtension: .mov, fileName: "justice")
                ).asMediaItemModel,
                MovieMediaItemModel(
                    title: "Oppenheimer",
                    genreTypes: [.crime, .thriller],
                    heroTitle: "Oscar-winning masterpiece",
                    tileImage: .oppenheimerSquare,
                    heroImage: .oppenheimerLarge,
                    heroVideo: nil
                ).asMediaItemModel,
                GameMediaItemModel(
                    title: "Star Wars: Outlaws",
                    genreTypes: [.action, .adventure],
                    heroTitle: "In a Galaxy Far, Far Away...",
                    tileImage: .starWarsOutlawsSquare,
                    heroImage: .starWarsOutlawsLarge,
                    heroVideo: nil
                ).asMediaItemModel,
                GameMediaItemModel(
                    title: "Grand Theft Auto VI",
                    genreTypes: [.action, .adventure],
                    heroTitle: "Welcome to Leonida",
                    tileImage: .gtaviSquare,
                    heroImage: .gtaviLarge,
                    heroVideo: nil
                ).asMediaItemModel,
                MovieMediaItemModel(
                    title: "Dune: Part Two",
                    genreTypes: [.action, .adventure],
                    heroTitle: "Explore the mythic journey",
                    tileImage: .duneSquare,
                    heroImage: .duneLarge,
                    heroVideo: nil
                ).asMediaItemModel,
                MusicMediaItemModel(
                    title: "Random Access Memories by Daft Punk",
                    genreTypes: [.house, .funk, .techno],
                    heroTitle: "Icons of the Electro-Funk",
                    tileImage: .daftPunkSquare,
                    heroImage: .daftPunkLarge2,
                    heroVideo: nil
                ).asMediaItemModel,
                MovieMediaItemModel(
                    title: "Spider-Man: Across the Spider-Verse",
                    genreTypes: [.animation, .adventure],
                    heroTitle: "Discover Unexpected in the Spider-Verse",
                    tileImage: .spiderManSquare,
                    heroImage: .spiderManLarge,
                    heroVideo: nil
                ).asMediaItemModel,
                GameMediaItemModel(
                    title: "Mortal Kombat 1",
                    genreTypes: [.fighting],
                    heroTitle: "It runs in our blood",
                    tileImage: .mortalKombat1Square,
                    heroImage: .mortalKombat1Large,
                    heroVideo: nil
                ).asMediaItemModel,
                MovieMediaItemModel(
                    title: "Knives Out",
                    genreTypes: [.crime, .thriller],
                    heroTitle: "Everyone is a suspect",
                    tileImage: .knivesOutSquare,
                    heroImage: .knivesOutLarge,
                    heroVideo: nil
                ).asMediaItemModel,
                GameMediaItemModel(
                    title: "Doom Eternal",
                    genreTypes: [.action, .shooter],
                    heroTitle: "Burn the Hell",
                    tileImage: .doomEternalSquare,
                    heroImage: .doomEternalLarge,
                    heroVideo: .init(fileExtension: .mp4, fileName: "test")
                ).asMediaItemModel
            ]
        )
    }
}

// TODO: Remove unused assets
