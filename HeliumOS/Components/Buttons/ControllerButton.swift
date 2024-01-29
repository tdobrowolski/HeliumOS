//
//  ControllerButton.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 29/01/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

// TODO: Redesign, looks plain now
// TODO: Add isPressed effect in ButtonStyle
struct ControllerButton: View {
    let buttonType: ControllerButtonType
    let text: String?
    let onTap: (() -> Void)?
    
    @State private var animationHelper = false
    
    var body: some View {
        content
    }
    
    private var content: some View {
        Button {
            animationHelper.toggle()
            onTap?()
        } label: {
            HStack(spacing: 10.0) {
                icon
                label
            }
        }
    }
    
    private var icon: some View {
        Image(systemName: buttonType.iconName)
            .font(.system(size: 30.0))
            .fontWeight(.bold)
            .symbolRenderingMode(.multicolor)
            .foregroundColor(buttonType.iconColor)
    }
    
    @ViewBuilder
    private var label: some View {
        if let text {
            Text(text)
                .font(.figtree(size: 22.0, weight: .bold))
                .foregroundColor(.white)
        }
    }
    
    init(
        buttonType: ControllerButtonType,
        text: String?,
        onTap: (() -> Void)? = nil
    ) {
        self.buttonType = buttonType
        self.text = text
        self.onTap = onTap
    }
}

#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        ControllerButton(buttonType: .aButton, text: "Launch game")
    }
}
