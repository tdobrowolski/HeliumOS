//
//  ActiveMenuItem.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 30/03/2020.
//  Copyright © 2020 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation

final class ActiveMenuItem: ObservableObject {
    
    @Published var highlightedMenuItem: MediaItemModel?
    
    func setAsActive(item: MediaItemModel) {
        self.highlightedMenuItem = item
    }
    
    func getActiveItem() -> MediaItemModel? {
        return highlightedMenuItem
    }
    
    func getButtonActionForActiveItem() -> String {
        guard let highlightedMenuItemType = highlightedMenuItem?.mediaType else { return "" }
        switch highlightedMenuItemType {
        case .game:
            return "Launch game"
        case .movie:
            return "Watch movie"
        case .music:
            return "Stream album"
        case .announcement, .event:
            return "Read more"
        }
    }
    
    func getFormattedGenresString() -> String {
        guard let genres = highlightedMenuItem?.genres else { return "" }
        return genres.joined(separator: ", ")
    }
}
