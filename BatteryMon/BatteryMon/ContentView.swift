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
            HStack {
                Spacer()
                Button(action: quit) {
                    Label("Quit", systemImage: "xmark.circle.fill")
                }
                .foregroundColor(.secondary)
            }
            .buttonStyle(.borderless)
            
            Picker("Interval", selection: $interval) {
                ForEach(1...100, id: \.self) { i in
                    Text("\(i)%")
                }
            }
        }
        .padding()
    }
    
    func quit() {
        NSApp.terminate(nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
