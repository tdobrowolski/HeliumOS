//
//  NavigationView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct NavigationView: View {
    @Binding var currentTime: String
    @Binding var selectedMenuItem: MenuItemType
    @Binding var currentControllerInputSymbols: [ControllerInputType: String]
    
    var body: some View {
        content
    }
    
    var content: some View {
        ViewThatFits(in: .horizontal) {
            extendedLayout
            simplifiedLayout
        }
    }
    
    private var extendedLayout: some View {
        HStack {
            getMainButtons()
                .shadow(color: .oilBlack.opacity(0.6), radius: 16.0)
            Spacer()
            secondaryItems
                .shadow(color: .oilBlack.opacity(0.6), radius: 16.0)
        }
    }
    
    private var simplifiedLayout: some View {
        getMainButtons(isSimplified: true)
            .shadow(color: .oilBlack.opacity(0.6), radius: 16.0)
    }
    
    private func getMainButtons(isSimplified: Bool = false) -> some View {
        HStack(spacing: 32.0) {
            leftShoulderControllerIcon
            ForEach(MenuItemType.mainMenuTypes) { item in
                MenuButton(
                    isSelected: .init(
                        get: { selectedMenuItem == item },
                        set: { if $0 { selectedMenuItem = item } }
                    ),
                    item: item
                )
            }
            if isSimplified {
                MenuButton(
                    isSelected: .constant(false),
                    item: .profile
                )
            }
            rightShoulderControllerIcon
        }
    }
    
    private var secondaryItems: some View {
        HStack(spacing: 32.0) {
            timeIndicator
            ForEach(MenuItemType.utilsMenuTypes) { item in
                MenuButton(
                    isSelected: .constant(false),
                    item: item
                )
            }
        }
    }
    
    private var timeIndicator: some View {
        Text(currentTime)
            .font(.figtree(size: 24.0, weight: .bold))
            .foregroundColor(.frostWhite)
            .animation(.easeOut)
            .contentTransition(.numericText())
            .frame(alignment: .trailing)
    }
    
    @ViewBuilder
    private var rightShoulderControllerIcon: some View {
        if let rightShoulderSymbolName = currentControllerInputSymbols[.rightShoulder] {
            Image(systemName: rightShoulderSymbolName.filled)
                .font(.system(size: 24.0))
                .fontWeight(.bold)
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.frostWhite)
        }
    }
    
    @ViewBuilder
    private var leftShoulderControllerIcon: some View {
        if let leftShoulderSymbolName = currentControllerInputSymbols[.leftShoulder] {
            Image(systemName: leftShoulderSymbolName.filled)
                .font(.system(size: 24.0))
                .fontWeight(.bold)
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.frostWhite)
        }
    }
}

#Preview {
    ZStack {
        Color.oilBlack.ignoresSafeArea()
        NavigationView(
            currentTime: .constant("21:37"),
            selectedMenuItem: .constant(.home),
            currentControllerInputSymbols: .constant([:])
        )
        .padding(40.0)
    }
}
