//
//  ItemDetailsView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct ItemDetailsView: View {
    var selectedItem: MediaItemModel?
    
    var body: some View {
        content
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
    }
    
    private var content: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            activeItemTitle
            HStack(spacing: 16.0) {
                activeItemSubtitle
                capsuleView
                activeItemGenresLabel
                capsuleView
                controllerButton
            }
        }
    }
    
    private var activeItemTitle: some View {
        Text(selectedItem?.heroTitle ?? "")
            .font(.calSans(size: 62.0))
            .foregroundColor(.white)
    }
    
    private var activeItemSubtitle: some View {
        Text(selectedItem?.title ?? "")
            .font(.figtree(size: 22.0, weight: .bold))
            .foregroundColor(.white)
    }
    
    private var activeItemGenresLabel: some View {
        Text(selectedItem?.formattedGenres ?? "")
            .font(.figtree(size: 22.0, weight: .bold))
            .foregroundColor(.white)
    }
    
    private var controllerButton: some View {
        Button {
            print("👆 Action button was tapped")
        } label: {
            HStack(spacing: 10.0) {
                Image("controllerButtonA")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                Text(selectedItem?.type.actionTitle ?? "")
                    .font(.figtree(size: 22.0, weight: .bold))
                    .foregroundColor(.white)
            }
        }
    }
    
    private var capsuleView: some View {
        Capsule()
            .foregroundColor(.yellowNeon)
            .frame(
                width: 4.0,
                height: 20.0,
                alignment: .center
            )
    }
}
