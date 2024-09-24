//
//  CharacterDetails.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 10/09/24.
//

import SwiftUI

struct CharacterDetails: View {
    
    let character: Character
    
    let date = Date()
    
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject private var store: Store<AppState>
    
    var body: some View {
        let props = map(state: store.state.favoriteState, store: store)
        
        NavigationStack {
            ScrollView {
                VStack {
                        ZStack{
                            CustomImage(image: character.image)
                                .overlay {
                                    LinearGradient(colors: [.black.opacity(0.3),.black.opacity(0.9)], startPoint: .top, endPoint: .bottom)
                                }
                                .frame(height: 536)
                            VStack {
                                CustomImage(image: character.image)
                                    .frame(width: 156, height: 194.32)
                                    .padding(.top,135)
                                
                                Text(character.name)
                                    .font(.custom(.RobotoBold,size: 31.16))
                                    .fontWeight(.bold)
                                    .padding(.top,36.68)
                                    .foregroundColor(.white)
                                
                                Text(character.origin.name)
                                    .font(.custom(.RobotoLight,size: 14))
                                    .fontWeight(.regular)
                                    .foregroundStyle(.white)
                                
                                Text(character.status)
                                    .font(.custom(.RobotoLight,size: 14))
                                    .padding(.top, 6)
                                    .foregroundColor(.characterDiedStatus)
                            }
                        }
                        VStack {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Potrayed")
                                        .foregroundStyle(.appGreen)
                                        .font(.custom(.RobotoBold, size: 14))
                                    Text(character.species)
                                        .foregroundStyle(.white)
                                        .font(.custom(.RobotoLight,size: 14))
                                        .fontWeight(.regular)
                                }.frame(alignment: .leading)
                                Spacer()
                                HStack(alignment: .center) {
                                    Text(date.formatDate(date: character.created))
                                        .foregroundStyle(.white)
                                        .font(.custom(.RobotoLight,size: 14))
                                        .fontWeight(.semibold)
                                    Label("", systemImage: "gift")
                                        .labelsHidden()
                                        .labelStyle(.iconOnly)
                                }
                            }
                            
                            HStack{
                                
                                VStack(alignment: .leading) {
                                    Text("Location")
                                        .foregroundStyle(.appGreen)
                                        .font(.custom(.RobotoBold, size: 14))
                                        .alignmentGuide(.trailing) { d in d[.leading] }
                                    Text(character.location.name)
                                        .foregroundStyle(.white)
                                        .font(.custom(.RobotoLight,size: 14))
                                        .fontWeight(.regular)
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .leading)  {
                                    Text("Gender")
                                        .foregroundStyle(.appGreen)
                                        .font(.custom(.RobotoBold, size: 14))
                                    Text(character.gender)
                                        .foregroundStyle(.white)
                                        .font(.custom(.RobotoLight,size: 14))
                                        .fontWeight(.regular)
                                }
                            }
                            .padding(.top,48)
                        }
                        .padding(.horizontal,20)
                        
                        VStack(alignment: .leading) {
                            Text("Appeared in")
                                .foregroundStyle(.appGreen)
                                .font(.custom(.RobotoBold, size: 14))
                                .padding(.horizontal,20)
                            
                            ScrollView(.horizontal,showsIndicators: false) {
                                    HStack(spacing: 15) {
                                        ForEach(0..<character.episode.count,id: \.self) {episode in
                                            NavigationLink(destination: EpisodeDetails(episodeId: episode + 1)) {
                                                EpisodeView(index: episode + 1)
                                            }
                                        }
                                    }
                                    .padding()
                                }
                            
                                Text("Other characters")
                                    .foregroundStyle(.white)
                                    .font(.custom(.RobotoBold, size: 23.02))
                                    .fontWeight(.bold)
                                    .frame(alignment: .leading)
                                    .padding(.horizontal,20)
                                
                                OtherCharactersView()
                                    .padding(.top,14)
                                    .padding(.horizontal,10)
                            
                        }.padding(.top,48)
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                       Label("", systemImage: "arrow.left")
                           .foregroundColor(.white)
                   }
                }
            }
            .tint(.white)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            props.addFavorite(character)
                        }) {
                            if props.isIncluded(character) {
                                Label("",systemImage: "heart.fill")
                                    .labelsHidden()
                                    .foregroundColor(.appGreen)
                            } else {
                                Label("",systemImage: "heart")
                                    .labelsHidden()
                                    .foregroundColor(.white)
                                    .tint(.grayHeart)
                            }
                        }
                }
            }
            .tint(props.isIncluded(character) ? .appGreen : .white)
            .toolbarBackground(.hidden, for: .navigationBar)
            .edgesIgnoringSafeArea(.vertical)
        }
    }
}

#Preview {
    CharacterDetails(character: .example)
}
