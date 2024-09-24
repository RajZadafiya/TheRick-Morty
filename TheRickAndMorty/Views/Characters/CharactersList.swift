//
//  CharactersList.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 07/09/24.
//

import SwiftUI

struct CharactersList: View {
    
    @StateObject private var charactersVM = CharacterViewModel(
        service: APIService()
    )
    
    @State private var isFetchingNextPage = false //simulate is loading
        private let minThresh: CGFloat = -100
    
    var body: some View {
        NavigationStack {
            HStack {
                switch charactersVM.state {
                case .loading:
                    HomeScreenShimmerView()
                case .success(let characters):
                    GeometryReader { scrollViewGeo in
                        ScrollView{
                            LazyVGrid(columns: columns) {
                                ForEach(characters) { character in
                                    NavigationLink(destination:CharacterDetails(character: character)){
                                        CharacterView(character: character)
                                    }
                                }
                                .listRowBackground(Color.black)
                            }
                            .padding(.top,57)
                            .background(.black)
                            .background(GeometryReader {
                                Color.clear
                                    .preference(key: ViewOffsetKey.self,
                                                value:  $0.frame(in: .named("container")).maxY)
                            })
                            .onPreferenceChange(ViewOffsetKey.self) { maxY in
                                if scrollViewGeo.size.height - maxY > minThresh {
                                    if !isFetchingNextPage {
                                        isFetchingNextPage = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                            //response
                                            if charactersVM.canLoadMore() {
                                                charactersVM.currentPage += 1
                                            }
                                        }
                                    }
                                }
                            }
                            if isFetchingNextPage {
                                ProgressView()
                                    .tint(.appGreen)
                                    .frame(width: 120, height: 120, alignment: .center)
                                    .font(.system(size: 100))
                                    .scaleEffect(1.5)
                            }
                        }
                        .coordinateSpace(name: "container")
                    }
                case .failed(let error):
                    ErrorView(error: error.localizedDescription)
                default :
                    EmptyView()
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
            .background(Color.black.ignoresSafeArea())
//            .navigationTitle ("Rick and Morty")
            .navigationBarItems(
                leading: Text("Rick & Morty")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .font(.custom(.RobotoThin, size: 23)),
                    trailing:
                    HStack {
                        NavigationLink(destination: Search()) {
                            Label("", systemImage: "magnifyingglass")
                                .labelsHidden()
                                .foregroundColor(.white)
                                .frame(alignment: .leading)
                        }
                        NavigationLink(destination: Favourites()) {
                            Label("", systemImage: "heart.fill")
                                .labelsHidden()
                                .foregroundColor(.appGreen)
                                .frame(alignment: .leading)
                        }
                    }
                )
        }.background(Color.black.ignoresSafeArea())
//        .onAppear{
//            let appearance = UINavigationBarAppearance()
//            appearance.configureWithOpaqueBackground()
//            appearance.backgroundColor = .black
//
//            let attrs: [NSAttributedString.Key: Any] = [
//                .foregroundColor: UIColor.white,
//                .font: UIFont.monospacedSystemFont(ofSize: 36, weight: .bold)
//            ]
//
//            appearance.largeTitleTextAttributes = attrs
//
//            UINavigationBar.appearance().scrollEdgeAppearance = appearance
//        }
           .task(id: charactersVM.currentPage) {
                await charactersVM.getCharacters()
                isFetchingNextPage = false
            }
    }
}

#Preview {
    CharactersList()
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
    }
}
