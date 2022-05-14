//
//  MediaTile.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct MediaTile: View {
    enum ParentPosition {
        case leading, center, trailing
    }
    
    let mediaItem: MediaItemModel
    let isActive: Bool
    let parentPosition: ParentPosition
    
    let itemDidSelect: (MediaItemModel) -> ()
    
    var body: some View {
        Image(mediaItem.tileImagePath ?? "")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaleEffect(isActive ? 1.1 : 1.0)
            .clipShape(
                RoundedCornersShape(corners: isActive ? .allCorners : roundedCorners, radius: 10.0)
                    .scale(isActive ? 1.1 : 1.0)
            )
            .overlay(
                RoundedRectangle(cornerRadius: isActive ? 10.0 : 0)
                    .scale(isActive ? 1.1 : 1.0)
                    .stroke(Color.blueNeon, lineWidth: isActive ? 8.0 : 0)
                    .shadow(color: Color.blueNeon.opacity(isActive ? 0.5 : 0), radius: 16.0, x: 0, y: 0)
            )
            .zIndex(isActive ? 1 : -1)
            .animation(.easeOut(duration: 0.1), value: 1.0)
            .frame(width: 280.0, height: 280.0)
            .onTapGesture {
                UIAudioService.shared.playUISound(for: .changeSelection)
                itemDidSelect(mediaItem)
            }
    }
    
    private var roundedCorners: UIRectCorner {
        switch parentPosition {
        case .leading:
            return [.topLeft, .bottomLeft]
        case .center:
           return []
        case .trailing:
            return [.topRight, .bottomRight]
        }
    }
}
