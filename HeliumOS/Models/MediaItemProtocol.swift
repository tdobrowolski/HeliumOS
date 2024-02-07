//
//  MediaItemProtocol.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 27/01/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

protocol MediaItemProtocol: Identifiable, Equatable {
    var id: String { get }
    var title: String { get }
    var heroTitle: String? { get }
    var type: MediaType { get }
    var tileImage: VisualContentModel { get }
    var heroImage: VisualContentModel { get }
    var heroVideo: VisualContentModel? { get }
    var genres: [String] { get }
    var formattedGenres: String { get }
}
