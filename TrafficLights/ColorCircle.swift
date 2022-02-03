//
//  ColorCircle.swift
//  TrafficLights
//
//  Created by Artiom Poluyanovich on 2.02.22.
//

import SwiftUI

struct ColorCircle: View {
    let isOn: Bool
    let lightColor: Color
    
    var body: some View {
        Circle()
            .foregroundColor(lightColor.opacity(lightOpacity()))
            .frame(width: 100, height: 100)
            .shadow(color: shadowColor(), radius: 15)
    }
    
    private func shadowColor() -> Color {
        let lightColor = isOn ? lightColor : Color.clear
        return lightColor
    }
    
    private func lightOpacity() -> Double {
        let lightOpacity = isOn ? 1 : 0.5
        return lightOpacity
    }
}

struct ColorCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircle(isOn: false, lightColor: .red)
    }
}
