//
//  Fonts.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 07/09/24.
//

import UIKit

enum CustomFonts: String {
    case RobotoThin =  "Roboto-Thin"
    case RobotoLight =  "Roboto-Light"
    case RobotoBold = "Roboto-Bold"
}

enum CustomWeights: Int {
    case Weight_100 = 100
    case Weight_200 = 200
    case Weight_300 = 300
    case Weight_400 = 400
    case Weight_500 = 500
    case Weight_600 = 600
    case Weight_700 = 700
    case Weight_800 = 800
    case Weight_900 = 900
}

struct PrintCustomFonts {
    func printCustomFontsOfSystem(){
        let fontFamilyNames = UIFont.familyNames
        
        for fontFamily in fontFamilyNames {
            print("FontFamily Name --->>>>  [\(fontFamily)]")
            
            let fontName = UIFont.fontNames(forFamilyName: fontFamily)
            print("FontName --->>>>  [\(fontName)]")
        }
    }
}
