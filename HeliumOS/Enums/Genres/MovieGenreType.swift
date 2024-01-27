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
    
    var title: String {
        switch self {
        case .crime: return "Crime"
        case .thriller: return "Thriller"
        case .scifi: return "Sci-Fi"
        case .action: return "Action"
        }
    }
}
