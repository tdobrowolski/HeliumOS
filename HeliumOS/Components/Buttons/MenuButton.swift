//
//  MenuButton.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct MenuButton: View {
    @Binding var isSelected: Bool
    
    let item: MenuItemType
    let onTap: (() -> Void)?
    
    @State private var animationHelper = false
    
    
    var body: some View {
        content
    }
    
    private var content: some View {
        Button {
            animationHelper.toggle()
            isSelected = true
            onTap?()
        } label: {
            Image(systemName: item.iconName)
                .font(.system(size: 24.0))
                .fontWeight(.bold)
                .symbolRenderingMode(item.symbolRenderingMode)
                .symbolEffect(
                    .bounce.down,
                    options: .speed(1.3),
                    value: animationHelper
                )
                .foregroundColor(isSelected ? .blueNeon : .white)
        }
    }
    
    init(
        isSelected: Binding<Bool> = .constant(false),
        item: MenuItemType,
        onTap: (() -> Void)? = nil
    ) {
        _isSelected = isSelected
        self.item = item
        self.onTap = onTap
    }
}
