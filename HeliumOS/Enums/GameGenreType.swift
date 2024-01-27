//
//  GameGenreType.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 27/01/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

enum GameGenreType {
    case action
    case rpg
    case horror
    case survival
    case adventure
    case shooter
    
    var title: String {
        switch self {
        case .action: return "Action"
        case .rpg: return "RPG"
        case .horror: return "Horror"
        case .survival: return "Survival"
        case .adventure: return "Adventure"
        case .shooter: return "Shooter"
        }
    }
}
