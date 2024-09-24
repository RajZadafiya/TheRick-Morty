//
//  Font+Extension.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 08/09/24.
//

import SwiftUI

extension Font {
    static func custom(_ font: CustomFonts, size: CGFloat = 15) -> SwiftUI.Font {
        SwiftUI.Font.custom(font.rawValue, size: size)
    }
}

