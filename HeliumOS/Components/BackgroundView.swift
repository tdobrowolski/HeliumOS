//
//  BackgroundView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct BackgroundView: View {    
    @Binding var activeItem: MediaItemModel?
    @Binding var items: [MediaItemModel]
    @State private var transitionDirection: XAxisTransitionDirection?
    
    private let gradient = Gradient(
        colors: [
            .init(red: 0, green: 0, blue: 0).opacity(0.3),
            .init(red: 0.04, green: 0.04, blue: 0.04).opacity(0.25),
            .clear,
            .init(red: 0.18, green: 0.18, blue: 0.18).opacity(0.5),
            .init(red: 0.33, green: 0.33, blue: 0.33).opacity(0.4),
            .clear,
            .clear
        ]
    )
        
    var body: some View {
        ZStack(alignment: .center) {
            backgroundImage
                .animation(
                    .easeOut(duration: 0.5),
                    value: transitionDirection?.id
                )
                .transition(
                    transitionDirection?.transition ?? .identity
                )
            backgroundGradient
        }
        .background {
            backgroundImage
                .blur(radius: 8.0)
                .scaleEffect(1.1)
        }
        .onChange(of: activeItem) { oldValue, newValue in
            guard let oldValue,
                  let newValue,
                  let oldValueIndex = items.firstIndex(of: oldValue),
                  let newValueIndex = items.firstIndex(of: newValue) else {
                return
            }
            
            switch (oldValueIndex, newValueIndex) {
            case let (old, new) where old < new:
                transitionDirection = .right
                
            case let (old, new) where old > new:
                transitionDirection = .left
                
            default:
                return
            }
        }
    }
    
    var backgroundImage: some View {
        Image(activeItem?.heroImage.fileName ?? "")
            .resizable()
            .scaledToFill()
            .id(transitionDirection?.id)
            .containerRelativeFrame(.horizontal)
    }
    
    var backgroundGradient: some View {
        LinearGradient(
            gradient: gradient,
            startPoint: .top,
            endPoint: .bottom
        )
    }
}
