//
//  MediaTile.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct MediaTile: View {   
    @State private var isFocused = false
    
    let mediaItem: MediaItemModel
    
    var body: some View {
        Image(mediaItem.tileImagePath ?? "")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaleEffect(isFocused ? 1.1 : 1.0)
            .clipShape(
                RoundedRectangle(cornerRadius: isFocused ? 10.0 : 0)
                    .scale(isFocused ? 1.1 : 1.0)
            )
            .overlay(
                RoundedRectangle(cornerRadius: isFocused ? 10.0 : 0)
                    .scale(isFocused ? 1.1 : 1.0)
                    .stroke(Color.blueNeon, lineWidth: isFocused ? 8.0 : 0)
                    .shadow(color: Color.blueNeon.opacity(isFocused ? 0.5 : 0), radius: 16.0, x: 0, y: 0)
            )
            .zIndex(isFocused ? 1 : -1)
            .animation(.easeOut(duration: 0.1), value: 1.0)
            .frame(width: 280.0, height: 280.0)
            .onTapGesture {
                UIAudioService.shared.playUISound(for: .changeSelection)
            }
    }
}
