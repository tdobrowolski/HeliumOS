//
//  ActionButton.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 29/01/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct ActionButton: View {
    let symbolName: String?
    let text: String?
    let onTap: (() -> Void)?
        
    var body: some View {
        content
    }
    
    private var content: some View {
        Button {
            onTap?()
        } label: {
            HStack(spacing: 10.0) {
                icon
                label
            }
        }
    }
    
    @ViewBuilder
    private var icon: some View {
        if let symbolName {
            Image(systemName: symbolName)
                .font(.system(size: 28.0))
                .fontWeight(.bold)
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.blueNeon)
                .background {
                    Circle()
                        .fill(Color.frostWhite.opacity(0.9))
                }
        }
    }
    
    @ViewBuilder
    private var label: some View {
        if let text {
            Text(text)
                .font(.figtree(size: 22.0, weight: .bold))
                .foregroundColor(.frostWhite)
                .minimumScaleFactor(0.9)
                .lineLimit(1)
        }
    }
    
    init(
        symbolName: String?,
        text: String?,
        onTap: (() -> Void)? = nil
    ) {
        self.symbolName = symbolName
        self.text = text
        self.onTap = onTap
    }
}

#Preview {
    ZStack {
        Color.oilBlack
            .ignoresSafeArea()
        ActionButton(symbolName: nil, text: "Launch game")
            .buttonStyle(ActionButtonStyle())
    }
}
