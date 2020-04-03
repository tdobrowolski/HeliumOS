//
//  MediaItemModel.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 29/03/2020.
//  Copyright © 2020 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation

struct MediaItemModel: Identifiable {
    
    enum MediaType {
        case game
        case movie
        case music
        case announcement
        case event
    }
    
    var id: String = UUID().uuidString
    
    var title: String
    var genres: [String]?
    var mediaType: MediaType
    
    var largeTitle: String?
    var backgroundMediaPath: String?
    var tileImagePath: String?
    
    var isDefault: Bool = false
}
