//
//  RootViewModel.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 21/02/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

// TODO: Check if Combine & ObservableObject needed

import Combine

final class RootViewModel: ObservableObject {
    let homeViewModel = HomeViewModel()
}
