//
//  ContentView.swift
//  Natife-Test
//
//  Created by Vova on 12/10/2023.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var sortingButton: some View {
        Button {
            viewModel.sortButtonPressed()
        } label: {
            Image(systemName: "arrow.up.and.down.text.horizontal")
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView() {
                NavigationLink("", destination: DetailView(viewModel: DetailViewModel(postId: viewModel.detailedPostId)), isActive: $viewModel.showDetailed)
                ForEach(viewModel.posts, id:\.self) { post in
                    PostCellView(post: post)
                        .onTapGesture {
                            viewModel.showDetailedView(postId: post.postId)
                            print("Works")
                        }
                        .padding(.bottom)
                }
            }
            .navigationTitle("Posts")
            .toolbar {
                ToolbarItem{
                    Button {
                        viewModel.sortButtonPressed()
                    } label: {
                        Image(systemName: "arrow.up.and.down.text.horizontal")
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    MainView()
}
