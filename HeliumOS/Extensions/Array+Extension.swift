//
//  Array+Extension.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

extension Array where Element == MediaItemModel {
    func getParentPosition(for item: MediaItemModel) -> MediaTile.ParentPosition {
        switch firstIndex(where: { $0 == item }) {
        case startIndex: return .leading
        case endIndex - 1: return .trailing
        default: return .center
        }
    }
}
