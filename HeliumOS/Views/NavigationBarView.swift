//
//  NavigationBarView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct NavigationBarView: View {
    var currentTime: String
    
    var body: some View {
        HStack {
            mainItems
            Spacer()
            secondaryItems
        }
        .font(.system(size: 22.0, weight: .bold))
    }
    
    private var mainItems: some View {
        HStack(spacing: 50.0) {
            ForEach(MenuItemType.allCases) {
                MenuButton(item: $0)
            }
        }
    }
    
    private var secondaryItems: some View {
        HStack(spacing: 50.0) {
            Text(currentTime)
                .font(.productSansBold(size: 24.0))
                .foregroundColor(.white)
            MenuButton(item: .notifications)
            Image(systemName: "wifi")
                .foregroundColor(.white)
            Image("avatar")
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
}
