//
//  ItemDetailsView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct ItemDetailsView: View {
    var activeItem: MediaItemModel?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            activeItemTitle
            HStack(spacing: 20.0) {
                activeItemSubtitle
                capsuleView
                activeItemGenresLabel
                capsuleView
                controllerButton
            }
            .font(.productSansBold(size: 26.0))
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
    }
    
    private var activeItemTitle: some View {
        Text(activeItem?.largeTitle ?? "")
            .font(.productSansBold(size: 62.0))
            .foregroundColor(.white)
    }
    
    private var activeItemSubtitle: some View {
        Text(activeItem?.title ?? "")
            .foregroundColor(.white)
    }
    
    private var activeItemGenresLabel: some View {
        Text(activeItem?.formattedGenres ?? "")
            .foregroundColor(.white)
    }
    
    private var controllerButton: some View {
        HStack(spacing: 10.0) {
            Button(action: {
                print("👆 Action button was tapped")
            }) {
                Image("controllerButtonA")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                Text(activeItem?.mediaType.actionTitle ?? "")
                    .foregroundColor(.white)
            }
        }
    }
    
    private var capsuleView: some View {
        Capsule()
            .foregroundColor(.yellowNeon)
            .frame(width: 4.0, height: 20.0, alignment: .center)
    }
}
