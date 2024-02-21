//
//  BootView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 21/02/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct BootView: View {
    @State private var didAppear = false

    private let tintColor: Color

    var body: some View {
        content
            .ignoresSafeArea()
            .persistentSystemOverlays(.hidden)
            .onAppear { didAppear = true }
    }

    private var content: some View {
        ZStack {
            Rectangle()
                .fill(.oilBlack)
            shape
        }
        .overlay(alignment: .center) {
            systemLogotype
        }
        .overlay(alignment: .bottom) {
            infinityLogotype
                .padding(.bottom, 70.0)
        }
    }

    private var shape: some View {
        Circle()
            .fill(tintColor)
            .frame(width: 600.0)
            .blur(radius: 200.0)
            .scaleEffect(2.0)
            .animation(
                .easeOut(
                    duration: AnimationConstants.bootDuration
                )
            ) { content in
                content
                    .opacity(didAppear ? 0.3 : 0.2)
                    .offset(
                        x: didAppear ? -600.0 : -1200.0,
                        y: didAppear ? -600.0 : -1200.0
                    )
            }
    }

    private var systemLogotype: some View {
        Image(.heliumOSLogo)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 80.0)
            .foregroundStyle(tintColor)
    }

    private var infinityLogotype: some View {
        Image(._infinityLogo)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 50.0)
            .foregroundStyle(.frostWhite)
    }

    init() {
        tintColor = [.yellowNeon, .blueNeon].randomElement() ?? .yellowNeon
    }
}

#Preview {
    BootView()
}
