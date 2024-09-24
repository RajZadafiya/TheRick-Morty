//
//  ErrorView.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 07/09/24.
//

import SwiftUI

struct ErrorView: View {
    
    var error: String = "Something went wrong!"
    var body: some View {
        Label(error, systemImage: "xmark.circle")
    }
}

#Preview {
    ErrorView()
}
