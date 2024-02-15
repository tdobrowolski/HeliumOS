//
//  MediaItemModel.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 29/03/2020.
//  Copyright © 2020 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation
import SwiftUI

struct MediaItemModel: MediaItemProtocol {
    let id: String
    
    let title: String
    let genres: [String]
    let type: MediaType
    
    let heroTitle: String?

    let tileImage: ImageResource
    let heroImage: ImageResource
    let heroVideo: VisualContentModel?

    var formattedGenres: String { genres.joined(separator: ", ") }
}
