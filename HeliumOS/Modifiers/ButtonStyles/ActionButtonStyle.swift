//
//  ActionButtonStyle.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 31/01/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct ActionButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.interactiveSpring, value: configuration.isPressed)
    }
}
