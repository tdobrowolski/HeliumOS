//
//  MenuButton.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

struct MenuButton: View {
    @State var isSelected: Bool = false
    
    let item: MenuItemType
    
    var body: some View {
        Button(action : {
            print("👆 \(item) button was tapped")
        }) {
            item.icon
                .foregroundColor(isSelected ? Color.blueNeon : .white)
        }
    }
}
