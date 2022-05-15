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
    
    @Binding var activeItem: MediaItemModel?
    
    let mediaItem: MediaItemModel
    let parentPosition: ParentPosition
            
    var body: some View {
        contentView
            .scaleEffect(activeItem == mediaItem ? 1.1 : 1.0)
            .animation(.easeOut(duration: 0.3), value: activeItem)
    }
    
    private var contentView: some View {
        Image(mediaItem.tileImagePath ?? "")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(
                RoundedCornersShape(corners: activeItem == mediaItem ? .allCorners : roundedCorners, radius: 10.0)
            )
            .overlay(
                RoundedRectangle(cornerRadius: activeItem == mediaItem ? 10.0 : 0)
                    .stroke(Color.blueNeon, lineWidth: activeItem == mediaItem ? 8.0 : 0)
                    .shadow(color: Color.blueNeon.opacity(activeItem == mediaItem ? 0.5 : 0), radius: 16.0, x: 0, y: 0)
            )
            .zIndex(activeItem == mediaItem ? 1 : -1)
            .frame(width: 280.0, height: 280.0)
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
