//
//  MainTilesListView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct MainTilesListView: View {
    var mediaItems: [MediaItemModel]
    
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 0) {
                    rectangleSpacer
                    RawTilesView(mediaItems: mediaItems)
                    rectangleSpacer
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: 400,
                    alignment: .leading
                )
            }
    }
    
    private var rectangleSpacer: some View {
        Rectangle()
            .frame(width: 75.0, height: 350.0)
            .foregroundColor(.clear)
    }
}
