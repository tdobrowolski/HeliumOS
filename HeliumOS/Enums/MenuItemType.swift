//
//  MenuItemType.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation
import SwiftUI

enum MenuItemType: String {
    case home = "house"
    case games = "gamecontroller"
    case media = "rectangle.on.rectangle.angled"
    case store = "bag"
    case tv = "tv"
    case options = "circle"
    case notifications = "bell"
    
    var icon: Image { .init(systemName: rawValue) }
}

extension MenuItemType: Identifiable, CaseIterable  {
    var id: Self { self }
}
