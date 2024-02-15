//
//  VisualContentModel.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 15/02/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation

struct VisualContentModel: Equatable {
    let fileExtension: FileExtension
    let fileName: String

    var url: URL? {
        Bundle.main.url(
            forResource: fileName,
            withExtension: fileExtension.value
        )
    }
}
