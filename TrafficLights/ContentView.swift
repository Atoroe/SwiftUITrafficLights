//
//  ContentView.swift
//  TrafficLights
//
//  Created by Artiom Poluyanovich on 2.02.22.
//

import SwiftUI

enum CurrentLight {
    case clear, red, yellow, green
}

struct ContentView: View {
    @State private var currentLight = CurrentLight.clear
    
    @State private var buttonText = "START"
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack{
                trafficLights
                Spacer()
                ChangeColorButton(title: buttonText) {
                    if currentLight != .clear {
                        buttonText = "NEXT"
                    }
                    nextColor()
                }
            }
            .padding()
        }
    }
    
    private var trafficLights: some View {
        VStack {
            ColorCircle(color: .red,
                        lightColor: currentLight == .red ? Color.red : Color.clear,
                        opacity: currentLight == .red ? 1 : 0.5)
            ColorCircle(color: .yellow,
                        lightColor: currentLight == .yellow ? Color.yellow : Color.clear,
                        opacity: currentLight == .yellow ? 1 : 0.5)
            ColorCircle(color: .green,
                        lightColor: currentLight == .green ? Color.green : Color.clear,
                        opacity: currentLight == .green ? 1 : 0.5)
        }
    }
    
    private func nextColor() {
        switch currentLight {
        case .clear: currentLight = .red
        case .red: currentLight = .yellow
        case .yellow: currentLight = .green
        case .green: currentLight = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
