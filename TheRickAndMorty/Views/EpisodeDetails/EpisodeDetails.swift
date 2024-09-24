//
//  EpisodeDetails.swift
//  TheRickAndMorty
//
//  Created by Raj _Zadafiya    on 12/09/24.
//

import SwiftUI

struct EpisodeDetails: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let episodeId : Int
    
    @StateObject private var episodeDetailsVM = EpisodeDetailsViewModel(service: APIService())
    
    var body: some View {
        NavigationStack {
            VStack {
                switch episodeDetailsVM.state {
                case .loading:
                    ProgressView()
                case .success(let episodeDetails):
                    EpisodeDetailsView(episode: episodeDetails)
                case .failer(let error):
                    ErrorView(error: error.localizedDescription)
                default :
                    EmptyView()
                }
            }
            .task {
            await episodeDetailsVM.getEpisodeDetails(episodeId: episodeId)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem (placement: .navigationBarLeading){
                    Button(action: {
                        dismiss()
                    }, label: {
                        Label("",systemImage: "arrow.left")
                            .labelsHidden()
                    })
                }
            }
            .tint(.white)
        }
    }
}

#Preview {
    EpisodeDetails(episodeId: 28)
}
