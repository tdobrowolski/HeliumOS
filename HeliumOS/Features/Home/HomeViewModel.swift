//
//  HomeViewModel.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 27/01/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import Combine
import Foundation
import UIKit

final class HomeViewModel: ObservableObject {
    @Published var selectedItem: MediaItemModel?
    @Published var mediaItems: [MediaItemModel] = []
    @Published var currentTime: String = .timePlaceholder
    @Published var selectedMenuItem: MenuItemType = .home
    @Published var isReadyToPlay = false
    @Published var isGameControllerConnected = false
    
    let mediaRepository = MediaRepository()
    let gameControllerService = GameControllerService()
    let clockService = LiveClockService()

    let videoViewModel = VideoViewModel()

    private var subscriptions = Set<AnyCancellable>()

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

        $selectedItem
            .removeDuplicates()
            .map(\.?.heroVideo?.url)
            .sink { [weak self] videoUrl in
                self?.videoViewModel.update(with: videoUrl)
            }
            .store(in: &subscriptions)
        
        $selectedItem
            .removeDuplicates()
            .compactMap { $0?.tileImage }
            .sink { [weak self] tileImageResource in
                self?.changeControllerLight(for: tileImageResource)
            }
            .store(in: &subscriptions)
        
        gameControllerService.currentController
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .map { $0 == nil ? false : true }
            .assign(to: &$isGameControllerConnected)
        
        gameControllerService.controllerButtonInput
            .receive(on: DispatchQueue.main)
            .map(\.asHomeControllerActionType)
            .sink { [weak self] controllerActionType in
                self?.handleControllerActionType(controllerActionType)
            }
            .store(in: &subscriptions)
    }
    
    private func setInitialActiveItem() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.selectedItem = self?.mediaItems.first
        }
    }
    
    private func changeControllerLight(for image: ImageResource) {
        let image = UIImage(resource: image)
        guard let averageColor = image.averageColor else { return }
        
        gameControllerService.setLightColor(averageColor)
    }
    
    private func handleControllerActionType(_ actionType: HomeControllerActionType) {
        switch actionType {
        case .launchMedia: return
        case .nextMediaItem: selectNextMediaItem()
        case .prevMediaItem: selectPreviousMediaItem()
        case .nextMenuItem: selectNextMenuItem()
        case .prevMenuItem: selectPreviousMenuItem()
        }
    }
    
    private func selectNextMediaItem() {
        guard let selectedItemIndex = mediaItems.firstIndex(where: { $0 == selectedItem }) else { return }
        
        let nextItemIndex = selectedItemIndex + 1
        
        guard mediaItems.indices.contains(nextItemIndex) else { return }
        
        selectedItem = mediaItems[nextItemIndex]
    }
    
    private func selectPreviousMediaItem() {
        guard let selectedItemIndex = mediaItems.firstIndex(where: { $0 == selectedItem }) else { return }
        
        let prevItemIndex = selectedItemIndex - 1
        
        guard mediaItems.indices.contains(prevItemIndex) else { return }
        
        selectedItem = mediaItems[prevItemIndex]
    }
    
    private func selectNextMenuItem() {
        let menuItems = MenuItemType.mainMenuTypes
        guard let selectedItemIndex = menuItems.firstIndex(where: { $0 == selectedMenuItem }) else { return }
        
        let nextItemIndex = selectedItemIndex + 1
        
        guard menuItems.indices.contains(nextItemIndex) else { return }
        
        selectedMenuItem = menuItems[nextItemIndex]
        gameControllerService.fireHapticFeedback()
    }
    
    private func selectPreviousMenuItem() {
        let menuItems = MenuItemType.mainMenuTypes
        guard let selectedItemIndex = menuItems.firstIndex(where: { $0 == selectedMenuItem }) else { return }
        
        let prevItemIndex = selectedItemIndex - 1
        
        guard menuItems.indices.contains(prevItemIndex) else { return }
        
        selectedMenuItem = menuItems[prevItemIndex]
        gameControllerService.fireHapticFeedback()
    }
}

fileprivate extension ControllerInputType {
    var asHomeControllerActionType: HomeControllerActionType {
        switch self {
        case .buttonA: return .launchMedia
        case .dPadLeft: return .prevMediaItem
        case .dPadRight: return .nextMediaItem
        case .leftShoulder: return .prevMenuItem
        case .rightShoulder: return .nextMenuItem
        }
    }
}
