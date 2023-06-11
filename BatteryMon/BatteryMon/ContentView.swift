//
//  ContentView.swift
//  BatteryMon
//
//  Created by Quin on 6/10/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("interval") var interval = 10
    
    var body: some View {
        VStack {
            Picker("Interval", selection: $interval) {
                ForEach(1...100, id: \.self) { i in
                    Text("\(i)%")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
