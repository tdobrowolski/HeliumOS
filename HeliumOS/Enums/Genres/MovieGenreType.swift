//
//  MovieGenreType.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 27/01/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

enum MovieGenreType {
    case crime
    case thriller
    case scifi
    case action
    case adventure
    case biography
    case drama
    case animation

    var title: String {
        switch self {
        case .crime: return "Crime"
        case .thriller: return "Thriller"
        case .scifi: return "Sci-Fi"
        case .action: return "Action"
        case .adventure: return "Adventure"
        case .biography: return "Biography"
        case .drama: return "Drama"
        case .animation: return "Animation"
        }
    }
}
