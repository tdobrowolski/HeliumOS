//
//  CHHapticEventParameter+Extension.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 19/04/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import CoreHaptics

extension [CHHapticEventParameter] {
    static var tabChangeParameters: [CHHapticEventParameter] {
        [
            .init(parameterID: .hapticIntensity, value: 0.1),
            .init(parameterID: .hapticSharpness, value: 0.1)
        ]
    }
}
