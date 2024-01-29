//
//  ControllerButtonType.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 29/01/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import struct SwiftUI.Color

enum ControllerButtonType {
    case aButton
    
    var iconName: String {
        switch self {
        case .aButton: return "a.circle.fill"
        }
    }
    
    var iconColor: Color {
        switch self {
        case .aButton: return .blueNeon
        }
    }
}
