//
//  String+Extension.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 27/01/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

extension String {
    static var timePlaceholder: String { "--:--" }
    
    var filled: String { self.appending(".fill") }
}
