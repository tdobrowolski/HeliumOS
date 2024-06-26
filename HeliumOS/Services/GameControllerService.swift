//
//  GameControllerService.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 16/04/2024.
//  Copyright © 2024 Tobiasz Dobrowolski. All rights reserved.
//

import Combine
import CoreHaptics
import Foundation
import GameController

final class GameControllerService: ObservableObject {
    let currentController = CurrentValueSubject<GCController?, Never>(nil)
    let currentControllerInputSymbols = CurrentValueSubject<[ControllerInputType: String], Never>([:])
    
    let controllerButtonInput = PassthroughSubject<ControllerInputType, Never>()
    
    private var didConnectObserver: NSObjectProtocol?
    private var didDisconnectObserver: NSObjectProtocol?
    
    private var hapticEngine: CHHapticEngine?
    private var patternPlayer: CHHapticPatternPlayer?
    
    private var cancellable = Set<AnyCancellable>()
        
    init() {
        bind()
        listenForConnections()
    }
    
    private func bind() {
        currentController
            .receive(on: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] in self?.handleCurrentControllerChange($0) }
            .store(in: &cancellable)
        
        #if DEBUG
            controllerButtonInput
                .receive(on: DispatchQueue.main)
                .sink { inputType in
                    print("Pressed \(inputType)")
                }
                .store(in: &cancellable)
        #endif
    }
    
    private func listenForConnections() {
        let notificationCenter = NotificationCenter.default
        
        didConnectObserver = notificationCenter.addObserver(
            forName: .GCControllerDidConnect,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.controllerConnectionDidChange()
        }
        
        didDisconnectObserver = notificationCenter.addObserver(
            forName: .GCControllerDidDisconnect,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.controllerConnectionDidChange()
        }
    }
    
    private func controllerConnectionDidChange() {
        let connectedControllers = GCController.controllers()
        
        currentController.send(connectedControllers.first)
    }
    
    private func handleCurrentControllerChange(_ controller: GCController?) {
        setControllerInputScheme(for: controller)
        
        guard let controller else {
            hapticEngine = nil
            patternPlayer = nil
            return
        }
        
        listenForCurrentControllerCallbacks(controller)
        setAdaptiveTriggersResistance()
        setLightColor(.blueNeon)
    }
    
    private func setControllerInputScheme(for controller: GCController?) {
        guard let extendedController = controller?.extendedGamepad else {
            return currentControllerInputSymbols.send([:])
        }
        
        var inputScheme: [ControllerInputType: String] = [:]
        
        for domainInputType in ControllerInputType.allCases {
            switch domainInputType {
            case .buttonA:
                if let symbolName = extendedController.buttonA.sfSymbolsName {
                    inputScheme.updateValue(symbolName, forKey: .buttonA)
                }
                
            case .dPadRight:
                if let symbolName = extendedController.dpad.right.sfSymbolsName {
                    inputScheme.updateValue(symbolName, forKey: .dPadRight)
                }
                
            case .dPadLeft:
                if let symbolName = extendedController.dpad.left.sfSymbolsName {
                    inputScheme.updateValue(symbolName, forKey: .dPadLeft)
                }
                
            case .rightShoulder:
                if let symbolName = extendedController.rightShoulder.sfSymbolsName {
                    inputScheme.updateValue(symbolName, forKey: .rightShoulder)
                }
                
            case .leftShoulder:
                if let symbolName = extendedController.leftShoulder.sfSymbolsName {
                    inputScheme.updateValue(symbolName, forKey: .leftShoulder)
                }
                
            case .rightTrigger:
                if let symbolName = extendedController.rightTrigger.sfSymbolsName {
                    inputScheme.updateValue(symbolName, forKey: .rightTrigger)
                }
                
            case .leftTrigger:
                if let symbolName = extendedController.leftTrigger.sfSymbolsName {
                    inputScheme.updateValue(symbolName, forKey: .leftTrigger)
                }
            }
            
            currentControllerInputSymbols.send(inputScheme)
        }
    }
    
    private func listenForCurrentControllerCallbacks(_ controller: GCController) {
        guard let extendedGamepadController = controller.extendedGamepad else { return }
        
        extendedGamepadController.buttonA.pressedChangedHandler = { [weak self] _, _, isPressed in
            if isPressed { self?.controllerButtonInput.send(.buttonA) }
        }
        
        extendedGamepadController.dpad.right.pressedChangedHandler = { [weak self] _, _, isPressed in
            if isPressed { self?.controllerButtonInput.send(.dPadRight) }
        }
        
        extendedGamepadController.dpad.left.pressedChangedHandler = { [weak self] _, _, isPressed in
            if isPressed { self?.controllerButtonInput.send(.dPadLeft) }
        }
        
        extendedGamepadController.rightShoulder.pressedChangedHandler = { [weak self] _, _, isPressed in
            if isPressed { self?.controllerButtonInput.send(.rightShoulder) }
        }
        
        extendedGamepadController.leftShoulder.pressedChangedHandler = { [weak self] _, _, isPressed in
            if isPressed { self?.controllerButtonInput.send(.leftShoulder) }
        }
        
        extendedGamepadController.rightTrigger.pressedChangedHandler = { [weak self] _, _, isPressed in
            if isPressed { self?.controllerButtonInput.send(.rightTrigger) }
        }
        
        extendedGamepadController.leftTrigger.pressedChangedHandler = { [weak self] _, _, isPressed in
            if isPressed { self?.controllerButtonInput.send(.leftTrigger) }
        }
    }
    
    // TODO: Debug
    
    func debugPrint() {
        guard let currentController = currentController.value else { return }
        
        print("Battery: \(String(describing: currentController.battery))")
        print("Product category: \(currentController.productCategory)")
        print("Profile: \(currentController.physicalInputProfile)")
        print("Player index: \(currentController.playerIndex)")
        print("Vendor name: \(currentController.vendorName ?? "N/A")")
        print("Light: \(String(describing: currentController.light))")
    }
    
    // MARK: Light
    
    func setLightColor(_ color: UIColor) {
        guard let currentController = currentController.value else { return }
        
        let rgbValues = color.rgb
        
        currentController.light?.color = .init(
            red: rgbValues.red,
            green: rgbValues.green,
            blue: rgbValues.blue
        )
    }
    
    // MARK: Adaptive Triggers
    
    func setAdaptiveTriggersResistance() {
        guard let dualSense = currentController.value?.physicalInputProfile as? GCDualSenseGamepad else { return }
        
        let startPosition: Float = 0.0
        let resisitiveStrength: Float = 0.3
        
        dualSense.leftTrigger.setModeFeedbackWithStartPosition(startPosition, resistiveStrength: resisitiveStrength)
        dualSense.rightTrigger.setModeFeedbackWithStartPosition(startPosition, resistiveStrength: resisitiveStrength)
    }
    
    // MARK: Haptics
    
    func fireHapticFeedback() {
        guard let currentController = currentController.value else { return }
        
        hapticEngine = currentController.haptics?.createEngine(withLocality: .default)
        hapticEngine?.playsHapticsOnly = true
        
        let hapticEvent = CHHapticEvent(eventType: .hapticTransient, parameters: .tabChangeParameters, relativeTime: 0)
        
        do {
            let hapticPattern = try CHHapticPattern(events: [hapticEvent], parameters: [])
            patternPlayer = try hapticEngine?.makePlayer(with: hapticPattern)
            
            hapticEngine?.start() { [weak self] error in
                self?.handleHapticEngineStart(error)
            }
        } catch {
            print("Can't create valid pattern:", error)
        }
    }
    
    private func handleHapticEngineStart(_ error: Error?) {
        if let error {
            print("HapticEngine can't start:", error)
        }
        
        do {
            hapticEngine?.notifyWhenPlayersFinished { _ in .stopEngine }
            try patternPlayer?.start(atTime: CHHapticTimeImmediate)
        } catch {
            print("PatternPlayer can't start:", error)
        }
    }
}
