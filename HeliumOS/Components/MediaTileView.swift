//
//  MediaTileView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct MediaTileView: View {
    enum ParentPosition {
        case leading
        case center
        case trailing
        
        var roundedCorners: UIRectCorner {
            switch self {
            case .leading: return [.topLeft, .bottomLeft]
            case .center: return []
            case .trailing: return [.topRight, .bottomRight]
            }
        }
    }
    
    @Binding var isActive: Bool
    
    let mediaItem: MediaItemModel
    let parentPosition: ParentPosition
    
    var body: some View {
        content
            .scaleEffect(isActive ? 1.1 : 1.0)
            .animation(
                .easeOut(duration: 0.3),
                value: isActive
            )
    }
    
    private var content: some View {
        Image(mediaItem.tileImagePath ?? "")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(
                RoundedCornersShape(
                    corners: isActive ? .allCorners : parentPosition.roundedCorners,
                    radius: 10.0
                )
            )
            .overlay(roundedOverlay)
            .zIndex(isActive ? 1 : -1)
            .frame(width: 280.0, height: 280.0)
    }
    
    private var roundedOverlay: some View {
        RoundedRectangle(cornerRadius: isActive ? 10.0 : 0)
            .stroke(
                Color.blueNeon,
                lineWidth: isActive ? 8.0 : 0
            )
            .shadow(
                color: Color.blueNeon.opacity(isActive ? 0.5 : 0),
                radius: 16.0,
                x: 0,
                y: 0
            )
    }
}
