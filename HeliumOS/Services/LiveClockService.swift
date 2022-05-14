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
    @Published var currentTime: String = "--:--"

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
    func updateTimeValue() {
        currentTime = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .short)
    }
}
