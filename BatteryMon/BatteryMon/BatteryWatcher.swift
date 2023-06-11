//
//  BatteryWatcher.swift
//  BatteryMon
//
//  Created by Quin on 6/11/23.
//

import AppKit

class BatteryWatcher {
    let synth = NSSpeechSynthesizer()
    var timer: Timer?
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
            self.synth.startSpeaking("Hi")
        }
    }
}
