//
//  ContentView.swift
//  TrafficLights
//
//  Created by Artiom Poluyanovich on 2.02.22.
//

import SwiftUI

struct ContentView: View {
    @State private var isRedLightOn = false
    @State private var isYellowLightOn = false
    @State private var isGreenLightOn = false
    @State private var buttonText = "START"
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack{
                trafficLights
                Spacer()
                Button(action: { changeStatus()}) {
                    Text(buttonText)
                        .font(.largeTitle)
                }
            }
            .padding()
        }
    }
    
    private var trafficLights: some View {
        VStack {
            ColorCircle(isOn: isRedLightOn, lightColor: .red)
            ColorCircle(isOn: isYellowLightOn, lightColor: .yellow)
            ColorCircle(isOn: isGreenLightOn, lightColor: .green)
        }
    }
    
    private func changeStatus() {
        if !isRedLightOn && !isYellowLightOn && !isGreenLightOn {
            isRedLightOn.toggle()
            buttonText = "NEXT"
        } else if isRedLightOn {
            isRedLightOn.toggle()
            isYellowLightOn.toggle()
        } else if isYellowLightOn {
            isYellowLightOn.toggle()
            isGreenLightOn.toggle()
        } else {
            isGreenLightOn.toggle()
            isRedLightOn.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
