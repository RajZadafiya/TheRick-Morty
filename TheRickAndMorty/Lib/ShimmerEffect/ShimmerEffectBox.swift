//
//  ShimmerEffectBox.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 22/09/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct ShimmerEffectBox: View {
    @State private var startPoint = UnitPoint(x: -1.8, y: -1.2)
    @State private var endPoint = UnitPoint(x: 0, y: -0.2)
    var speed: CGFloat
    var colors: [Color]
    
    var body: some View {
        LinearGradient(
            colors: colors,
            startPoint: startPoint,
            endPoint: endPoint)
        .onAppear(perform: loopAnimation)
    }
    
    private func loopAnimation() {
        withAnimation(
            .easeInOut(duration: speed)
            .repeatForever(autoreverses: false)
        ) {
            startPoint = .init(x: 1, y: 1)
            endPoint = .init(x: 2.2, y: 2.2)
        }
    }
}

#Preview {
    ShimmerEffectBox(speed: 1.0, colors: [.gray, .white])
}
