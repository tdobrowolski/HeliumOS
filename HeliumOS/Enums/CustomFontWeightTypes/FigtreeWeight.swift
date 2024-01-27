//
//  FigtreeWeight.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 27/01/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

enum FigtreeWeight: String {
    case light
    case regular
    case medium
    case semibold
    case bold
    case extrabold
    case black
    
    var text: String { rawValue.uppercased() }
}
