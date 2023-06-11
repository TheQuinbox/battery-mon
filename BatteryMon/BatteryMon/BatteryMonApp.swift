//
//  BatteryMonApp.swift
//  BatteryMon
//
//  Created by Quin on 6/10/23.
//

import SwiftUI

@main
struct BatteryMonApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        MenuBarExtra("Battery Mon") {
            ContentView()
        }
        .menuBarExtraStyle(.window)
    }
}
