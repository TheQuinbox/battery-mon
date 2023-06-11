//
//  AppDelegate.swift
//  BatteryMon
//
//  Created by Quin on 6/11/23.
//

import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    let watcher = BatteryWatcher()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        watcher.start()
    }
}
