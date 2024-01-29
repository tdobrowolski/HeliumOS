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
    
    var body: some View {
        content
    }
    
    var content: some View {
        HStack {
            mainButtons
                .shadow(color: .black.opacity(0.6), radius: 16.0)
            Spacer()
            secondaryItems
                .shadow(color: .black.opacity(0.6), radius: 16.0)
        }
    }
    
    private var mainButtons: some View {
        HStack(spacing: 32.0) {
            ForEach(MenuItemType.mainMenuTypes) { item in
                MenuButton(
                    isSelected: .init(
                        get: { selectedMenuItem == item },
                        set: { if $0 { selectedMenuItem = item } }
                    ),
                    item: item
                )
            }
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
            .foregroundColor(.white)
            .animation(.easeOut)
            .contentTransition(.numericText())
            .frame(alignment: .trailing)
    }
    
    #warning("Deprecated solution.")
    private var avatarIndicator: some View {
        Image(.avatar)
            .resizable()
            .frame(width: 60.0, height: 60.0)
            .overlay(
                Capsule()
                    .stroke(Color.blueNeon, lineWidth: 3.0)
                    .shadow(
                        color: .blueNeon.opacity(0.5),
                        radius: 8.0,
                        x: 0,
                        y: 0
                    )
            )
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        NavigationView(
            currentTime: .constant("21:37"),
            selectedMenuItem: .constant(.home)
        )
        .padding(40.0)
    }
}
