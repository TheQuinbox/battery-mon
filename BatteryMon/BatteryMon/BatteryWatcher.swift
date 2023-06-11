//
//  BatteryWatcher.swift
//  BatteryMon
//
//  Created by Quin on 6/11/23.
//

import AppKit
import IOKit.ps

class BatteryWatcher {
    let synth = NSSpeechSynthesizer()
    var timer: Timer?
    let configManager = ConfigManager()
    var lastReported = 0
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            let level = self.getBatteryLevel()
            print("\(level) \(self.lastReported)")
            if level % self.configManager.interval == 0 && level != self.lastReported {
                self.lastReported = level
                self.synth.startSpeaking("Battery \(level)%")
            }
        }
    }
    
    func getBatteryLevel() -> Int {
        let snapshot = IOPSCopyPowerSourcesInfo()?.takeRetainedValue()
        let sources = IOPSCopyPowerSourcesList(snapshot)?.takeRetainedValue() as? [CFTypeRef]
        
        for source in sources ?? [] {
            let description = IOPSGetPowerSourceDescription(snapshot, source)?.takeUnretainedValue() as? [String: Any]
            
            if let currentCapacity = description?[kIOPSCurrentCapacityKey] as? Int, let maxCapacity = description?[kIOPSMaxCapacityKey] as? Int {
                let batteryLevel = Int((Double(currentCapacity) / Double(maxCapacity)) * 100)
                return batteryLevel
            }
        }
        
        return 0
    }
}
