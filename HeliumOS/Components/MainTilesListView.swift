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
        content
    }
    
    private var content: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 0.0) {
                    Spacer(minLength: MainLayoutConstants.safeAreaPadding)
                    ForEach(mediaItems) { item in
                        MediaTile(
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
                    Spacer(minLength: MainLayoutConstants.safeAreaPadding)
                }
            }
            .scrollClipDisabled()
        }
    }
    
    private func itemDidTap(_ item: MediaItemModel, proxy: ScrollViewProxy) {
        UIAudioService.shared.playUISound(for: .changeSelection)
        activeItem = item
        withAnimation(.easeOut(duration: 0.3)) {
            proxy.scrollTo(item.id)
        }
    }
}

enum MainLayoutConstants {
    static var safeAreaPadding: CGFloat { 60.0 }
}
