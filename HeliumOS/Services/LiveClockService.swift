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
    var currentTime: CurrentValueSubject<String, Never> = .init(.timePlaceholder)
    
    var timer: Timer?
    
    init() { startService() }
    
    deinit { stopService() }
    
    private func startService() {
        updateTimeValue()
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            target: self,
            selector: #selector(updateTimeValue),
            userInfo: nil,
            repeats: true
        )
    }
    
    private func stopService() { timer = nil }
    
    @objc
    private func updateTimeValue() {
        currentTime.send(
            DateFormatter.localizedString(
                from: Date(),
                dateStyle: .none,
                timeStyle: .short
            )
        )
    }
}
