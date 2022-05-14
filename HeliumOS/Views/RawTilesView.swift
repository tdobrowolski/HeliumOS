//
//  RawTilesView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct RawTilesView: View {
    var mediaItems: [MediaItemModel]

    var body: some View {
        ForEach(mediaItems) { MediaTile(mediaItem: $0) }
    }
}
