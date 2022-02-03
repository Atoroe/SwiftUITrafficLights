//
//  ColorCircle.swift
//  TrafficLights
//
//  Created by Artiom Poluyanovich on 2.02.22.
//

import SwiftUI

struct ColorCircle: View {
    
    let color: Color
    let lightColor: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .opacity(opacity)
            .frame(width: 100, height: 100)
            .shadow(color: lightColor, radius: 15)
    }
    
}

struct ColorCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircle(color: .red, lightColor: .red, opacity: 1)
    }
}
