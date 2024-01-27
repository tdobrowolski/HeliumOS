//
//  Font+Extension.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 14/05/2022.
//  Copyright © 2022 Tobiasz Dobrowolski. All rights reserved.
//

import SwiftUI

extension Font {
    // MARK: ProductSans
    
    static func productSans(size: CGFloat, weight: ProductSansWeight) -> Font {
        .custom("ProductSans-\(weight.text)", size: size)
    }
    
    // MARK: Cal Sans
    
    static func calSans(size: CGFloat, weight: CalSansWeight = .semibold) -> Font {
        .custom("CalSans-\(weight.text)", size: size)
    }
    
    // MARK: Figtree
    
    static func figtree(size: CGFloat, weight: FigtreeWeight) -> Font {
        .custom("Figtree-\(weight.text)", size: size)
    }
}
