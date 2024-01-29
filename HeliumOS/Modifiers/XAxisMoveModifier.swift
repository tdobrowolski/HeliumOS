//
//  XAxisMoveModifier.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 28/01/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

enum XAxisTransitionDirection: Equatable {
    case left
    case right
    
    var id: UUID { UUID() }
    
    var activeValue: CGFloat {
        switch self {
        case .left: return -50.0
        case .right: return 50.0
        }
    }
    
    var transition: AnyTransition? {
        .xAxisMove(direction: self)
    }
}

struct XAxisMoveModifier: ViewModifier {
    let offset: CGFloat
    let opacity: CGFloat
    
    func body(content: Content) -> some View {
        content
            .offset(x: offset)
            .opacity(opacity)
    }
}

extension AnyTransition {
    static func xAxisMove(direction: XAxisTransitionDirection) -> AnyTransition {
        .modifier(
            active: XAxisMoveModifier(offset: direction.activeValue, opacity: 0.0),
            identity: XAxisMoveModifier(offset: 0.0, opacity: 1.0)
        )
    }
}
