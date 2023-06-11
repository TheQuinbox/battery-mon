//
//  ConfigManager.swift
//  BatteryMon
//
//  Created by Quin on 6/10/23.
//

import SwiftUI

struct ConfigManager {
    @AppStorage("interval") var interval: Int = 10
}

