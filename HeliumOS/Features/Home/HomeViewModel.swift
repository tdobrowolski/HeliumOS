//
//  HomeViewModel.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 27/01/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import Combine
import Foundation

final class HomeViewModel: ObservableObject {
    @Published var selectedItem: MediaItemModel?
    @Published var mediaItems: [MediaItemModel] = []
    @Published var currentTime: String = .timePlaceholder
    @Published var selectedMenuItem: MenuItemType = .home
    
    let mediaRepository = MediaRepository()
    
    let clockService = LiveClockService()
    
    init() {
        bind()
        setInitialActiveItem()
    }
    
    private func bind() {
        mediaRepository.mainMediaItems
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .assign(to: &$mediaItems)
        
        clockService.currentTime
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .assign(to: &$currentTime)
    }
    
    private func setInitialActiveItem() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.selectedItem = self?.mediaItems.first
        }
    }
}
