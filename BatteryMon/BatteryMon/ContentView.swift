//
//  ContentView.swift
//  BatteryMon
//
//  Created by Quin on 6/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: MainViewModel
    
    init() {
        let configManager = ConfigManager()
        _viewModel = StateObject(wrappedValue: MainViewModel(configManager: configManager))
    }
    
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
            
            Picker("Interval", selection: $viewModel.selectedInterval) {
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
