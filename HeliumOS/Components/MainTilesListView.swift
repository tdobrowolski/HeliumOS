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
    @Binding var mediaItems: [MediaItemModel]
    
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
                        .onTapGesture { itemDidTap(item) }
                    }
                }
            }
            .scrollClipDisabled()
            .contentMargins(.horizontal, MainLayoutConstants.safeAreaPadding, for: .scrollContent)
            .onChange(of: activeItem) {
                withAnimation {
                    proxy.scrollTo(activeItem?.id, anchor: .leading)
                }
            }
        }
    }
    
    private func itemDidTap(_ item: MediaItemModel) {
        activeItem = item
    }
}

#Preview {
    @State var mediaRepository = MediaRepository()
    
    return MainTilesListView(
        activeItem: .constant(nil),
        mediaItems: .init(
            get: { mediaRepository.mainMediaItems.value },
            set: { _ in }
        )
    )
}
