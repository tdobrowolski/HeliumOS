//
//  MainTilesListView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

// FIXME: Fix contentMargins not tappable.
struct MainTilesListView: View {
    @Binding var activeItem: MediaItemModel?
    
    let mediaItems: [MediaItemModel]
    
    var body: some View {
        content
    }
    
    private var content: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 0.0) {
                    ForEach(mediaItems) { item in
                        MediaTileView(
                            isActive: .init(
                                get: { activeItem == item },
                                set: { _ in }
                            ),
                            mediaItem: item,
                            parentPosition: mediaItems.getParentPosition(for: item)
                        )
                        .id(item.id)
                        .onTapGesture { itemDidTap(item, proxy: proxy) }
                    }
                }
            }
            .scrollClipDisabled()
            .contentMargins(.horizontal, MainLayoutConstants.safeAreaPadding, for: .scrollContent)
        }
    }
    
    private func itemDidTap(_ item: MediaItemModel, proxy: ScrollViewProxy) {
        UIAudioService.shared.playUISound(for: .changeSelection)
        activeItem = item
        withAnimation(.easeOut(duration: 0.3)) {
            proxy.scrollTo(item.id, anchor: .leading)
        }
    }
}
