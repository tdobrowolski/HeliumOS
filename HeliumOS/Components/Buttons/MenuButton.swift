//
//  MenuButton.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct MenuButton: View {
    @Binding var isSelected: Bool
    
    let item: MenuItemType
    
    var body: some View {
        Button {
            print("👆 \(item) button was tapped")
        } label: {
            Image(systemName: item.iconName)
                .font(.system(size: 24.0))
                .fontWeight(.bold)
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(isSelected ? Color.blueNeon : .white)
        }
    }
}
