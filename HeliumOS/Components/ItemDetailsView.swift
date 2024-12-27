//
//  ItemDetailsView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct ItemDetailsView: View {
    @Binding var selectedItem: MediaItemModel?
    @Binding var currentControllerInputSymbols: [ControllerInputType: String]
    
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
            sublabels
        }
    }

    private var sublabels: some View {
        ViewThatFits(in: .horizontal) {
            longSublabels
            shortSublabels
        }
    }

    private var longSublabels: some View {
        HStack(spacing: 16.0) {
            activeItemSubtitle
            capsuleView
            activeItemGenresLabel
            capsuleView
            launchButton
        }
    }

    private var shortSublabels: some View {
        HStack(spacing: 16.0) {
            activeItemSubtitle
            capsuleView
            launchButton
        }
    }

    private var activeItemTitle: some View {
        Text(selectedItem?.heroTitle ?? "")
            .font(.calSans(size: 62.0))
            .foregroundColor(.frostWhite)
            .minimumScaleFactor(0.8)
            .lineLimit(2)
    }
    
    private var activeItemSubtitle: some View {
        Text(selectedItem?.title ?? "")
            .font(.figtree(size: 22.0, weight: .bold))
            .foregroundColor(.frostWhite)
            .minimumScaleFactor(0.9)
            .lineLimit(1)
    }
    
    private var activeItemGenresLabel: some View {
        Text(selectedItem?.formattedGenres ?? "")
            .font(.figtree(size: 22.0, weight: .bold))
            .foregroundColor(.frostWhite)
            .minimumScaleFactor(0.9)
            .lineLimit(1)
    }
    
    private var launchButton: some View {
        ActionButton(
            symbolName: currentControllerInputSymbols[.buttonA]?.filled,
            text: selectedItem?.type.actionTitle
        ) {
            // TODO: Add action
        }
        .buttonStyle(ActionButtonStyle())
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
