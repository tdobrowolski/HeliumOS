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
    
    var title: String {
        switch self {
        case .pop: return "Pop"
        case .dance: return "Dance"
        }
    }
}
