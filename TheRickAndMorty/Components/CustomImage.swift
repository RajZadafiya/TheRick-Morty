//
//  CustomImage.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 07/09/24.
//

import SwiftUI

struct CustomAsyncImageForDetailsScreen: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: .infinity,height: 538)
            .background(
                ZStack {
                    LinearGradient(colors: [.black.opacity(0.4),.black.opacity(0.6)], startPoint: .top, endPoint: .bottom)
                }
            )
    }
}

struct CustomImage: View {
    let image:String
    
    var body: some View {
        AsyncImage(url: URL(string: image)) { phase in
            switch phase {
            case .failure:
                Image(systemName: "photo")
                    .font(.largeTitle)
            case .success(let image):
                image
                    .resizable()
            default:
                ProgressView()
                    .foregroundColor(.green)
                    .tint(.appGreen)
            }
        }
//        .frame(width: 156, height: 194.32)
        .cornerRadius(5)
    }
}

#Preview {
    CustomImage(image: Character.example.image)
}
