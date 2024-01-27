//
//  MenuItemType.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation
import SwiftUI

enum MenuItemType {
    case home
    case games
    case media
    case store
    case tv
    case options
    case notifications
    case wifi
    case profile
    
    static var mainMenuTypes: [MenuItemType] {
        [.home, .games, .media, .store, .tv, .options]
    }
    
    static var utilsMenuTypes: [MenuItemType] {
        [.notifications, .wifi, .profile]
    }
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .games: return "gamecontroller"
        case .media: return "rectangle.on.rectangle.angled"
        case .store: return "bag"
        case .tv: return "tv"
        case .options: return "circle"
        case .notifications: return "bell.badge"
        case .wifi: return "wifi"
        case .profile: return "person.crop.circle.fill"
        }
    }
}

extension MenuItemType: Identifiable, CaseIterable  {
    var id: Self { self }
}
