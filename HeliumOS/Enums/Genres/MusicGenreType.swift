//
//  MusicGenreType.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 27/01/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

enum MusicGenreType {
    case pop
    case dance
    case electronic
    case house
    case funk
    case techno
    case synthcore

    var title: String {
        switch self {
        case .pop: return "Pop"
        case .dance: return "Dance"
        case .electronic: return "Electronic"
        case .house: return "House"
        case .funk: return "Funk"
        case .techno: return "Techno"
        case .synthcore: return "Synthcore"
        }
    }
}
