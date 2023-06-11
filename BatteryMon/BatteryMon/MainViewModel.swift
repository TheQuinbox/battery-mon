//
//  MainViewModel.swift
//  BatteryMon
//
//  Created by Quin on 6/10/23.
//

import Foundation

class MainViewModel: ObservableObject {
    private let configManager: ConfigManager
    
    init(configManager: ConfigManager) {
        self.configManager = configManager
        _selectedInterval = Published(initialValue: configManager.interval)
    }
    
    @Published var selectedInterval: Int {
        didSet {
            configManager.interval = selectedInterval
        }
    }
}
