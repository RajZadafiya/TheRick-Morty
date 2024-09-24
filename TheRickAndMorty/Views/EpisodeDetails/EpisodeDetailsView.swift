//
//  EpisodeView.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 12/09/24.
//

import SwiftUI

struct EpisodeDetailsView: View {
    
    let episode: Episode
    var body: some View {
        NavigationStack {
            VStack {
                 ZStack {
                    Image(.episodeBG)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .frame(minWidth: 0)
                        .overlay {
                            LinearGradient(colors: [.black.opacity(0.4),.black.opacity(0.6)], startPoint: .top, endPoint: .bottom)
                                .ignoresSafeArea()
                        }
                        .edgesIgnoringSafeArea(.all)
                    VStack(alignment: .center) {
                        VStack(alignment: .center) {
                            
                            Text(episode.episode)
                                .font(.custom(.RobotoBold,size: 30))
                                .padding(.all,4)
                                .padding(.horizontal, 10)
                                .background(.grayHeart.opacity(0.4))
                                .cornerRadius(10)
                            
                            Text(episode.air_date)
                                .padding(.horizontal, 10)
                                .background(.episodeBG.opacity(0.4))
                                .cornerRadius(5)
                        }
                        
                        VStack {
                            
                            Text("List of characters who have been seen in the episode.")
                                .font(.custom(.RobotoBold, size: 20))
                            
                        }.padding(.top,20)
                        
                        VStack {
                            ScrollView {
                                ForEach(episode.characters, id: \.self) {
                                    character in
                                        EpisodeCharacterView(url: character)
                                }
                            }
                        }.padding(.top,20)
                    }
                }
            }
            .navigationTitle(episode.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    EpisodeDetailsView(episode: .example)
}
