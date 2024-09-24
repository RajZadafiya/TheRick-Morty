//
//  Search.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 09/09/24.
//

import SwiftUI

struct Search: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var searchCharactersVM = SearchCharacterViewModel(service: APIService())
    
    @SwiftUI.State private var searchString = ""
    
    var body: some View {
        NavigationStack {
            VStack{
                switch searchCharactersVM.state {
                case .success(let searchCharacters):
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(searchCharacters) { character in
                                CharacterView(character: character)
                            }
                        }
                    }
                    .navigationBarBackButtonHidden(true)
                    .padding(.top,57)
                case .failure(let error):
                   ErrorView(error: error.localizedDescription)
                default :
                    HomeScreenShimmerView()
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Button(action: {
                                dismiss()
                            }) {
                                Label("", systemImage: "arrow.left")
                                    .labelsHidden()
                                    .foregroundColor(.white)
                                    .frame(alignment: .leading)
                            }
                            TextField("",text: $searchString, prompt: Text("Search")
                                .font(.custom(.RobotoThin,size: 33.25))
                                .fontWeight(.regular))
                            .frame(height: 86)
                            .background(.graySearchBG)
                            Button(action: {
                                searchString = ""
                            }) {
                                Label("", systemImage: "multiply")
                                    .labelsHidden()
                                    .foregroundColor(.white)
                                    .frame(alignment: .leading)
                            }.padding(.trailing, 10)
                        }
                        .frame(height: 86)
                        .background(.graySearchBG)
                }
            }
            .task(id: searchString) {
                let searchParams = SearchParams(name: searchString)
                await searchCharactersVM.getSearchFilterCharacters(params: searchParams)
            }
        }
    }
}

#Preview {
    Search()
}
