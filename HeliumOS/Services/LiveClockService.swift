//
//  LiveClockService.swift
//  HeliumOS
//
//  Created by Tobiasz Dobrowolski on 24/03/2020.
//  Copyright © 2020 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation
import Combine

final class LiveClockService: ObservableObject {
    
    let objectWillChange = PassthroughSubject<String, Never>()
    
    var timer: Timer?
    
    var currentTime: String = "" {
        didSet {
            objectWillChange.send(self.currentTime)
        }
    }
    
    init() {
        startService()
    }
    
    deinit {
        stopService()
    }
    
    private func startService() {
        self.updateTimeValue()
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimeValue), userInfo: nil, repeats: true)
    }
    
    private func stopService() {
        self.timer = nil
    }
    
    @objc func updateTimeValue() {
        self.currentTime = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
    }
    
    
}
