//
//  BackgroundView.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct BackgroundView: View {
    @State var showImageTransition = false
    
    let activeItem: MediaItemModel?
    
    var gradient = Gradient(
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
            backgroundGradient
        }
    }
    
    var backgroundImage: some View {
        GeometryReader { geo in
            Image(activeItem?.backgroundMediaPath ?? "")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geo.size.width, height: geo.size.height)
                .scaleEffect(showImageTransition ? 1.1 : 1)
                .opacity(showImageTransition ? 0.5 : 1)
                .transition(.move(edge: .leading))
        }
    }
    
    var backgroundGradient: some View {
        LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
    }
}
