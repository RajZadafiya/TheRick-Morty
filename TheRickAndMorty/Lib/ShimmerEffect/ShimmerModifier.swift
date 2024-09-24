//
//  ShimmerModifier.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 22/09/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct ShimmerModifier: ViewModifier {
    private var isActive: Bool
    private var speed: CGFloat
    private var colors: [Color] = [
        Color(uiColor: .systemGray5),
        Color(uiColor: .systemGray6),
        Color(uiColor: .systemGray5)]
    private var cornerRadius: CGFloat
    
    init(
        isActive: Bool,
        speed: CGFloat,
        colors: [Color],
        cornerRadius: CGFloat
    ) {
        self.isActive = isActive
        self.speed = speed
        self.cornerRadius = cornerRadius
        if !colors.isEmpty {
            self.colors = colors
        }
    }
    
    func body(content: Content) -> some View {
        if isActive {
            content
                .overlay {
                    ShimmerEffectBox(
                        speed: speed,
                        colors: colors
                    ).cornerRadius(cornerRadius)
                }
        }
    }
}

#Preview {
    ShimmerModifier(isActive: true, speed: 1.0, colors: [], cornerRadius: 10) as! any View
}
