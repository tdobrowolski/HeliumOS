//
//  MainTilesListView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct MainTilesListView: View {
    @Binding var activeItem: MediaItemModel?
    
    let mediaItems: [MediaItemModel]
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 0) {
                    Spacer(minLength: 75.0)
                    ForEach(mediaItems) { item in
                        MediaTile(
                            activeItem: $activeItem,
                            mediaItem: item,
                            parentPosition: mediaItems.getParentPosition(for: item)
                        )
                            .id(item.id)
                            .onTapGesture {
                                UIAudioService.shared.playUISound(for: .changeSelection)
                                activeItem = item
                                withAnimation(.easeOut(duration: 0.3)) {
                                    proxy.scrollTo(item.id)
                                }
                            }
                    }
                    Spacer(minLength: 75.0)
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
    }
}
