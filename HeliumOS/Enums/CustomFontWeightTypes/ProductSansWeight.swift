//
//  ProductSansWeight.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 27/01/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

enum ProductSansWeight: String {
    case regular
    case bold
    
    var text: String { rawValue.uppercased() }
}
