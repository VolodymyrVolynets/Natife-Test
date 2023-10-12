//
//  DetailView.swift
//  Natife-Test
//
//  Created by Vova on 12/10/2023.
//

import SwiftUI

struct DetailView: View {
    @StateObject var viewModel: DetailViewModel
    var body: some View {
        if viewModel.isLoading {
            Text("Loading...")
        } else {
            ScrollView {
                Image(systemName: "clock")
                    .data(url: URL(string: viewModel.post?.postImage ?? "")!)
                    .scaledToFit()
                
                Text(viewModel.post?.title ?? "Error")
                    .fontWeight(.bold)
                
                Text(viewModel.post?.text ?? "Error")
                
                HStack {
                    LikesCounter(likesCount: viewModel.post?.likesCount ?? -1)
                    
                    Spacer()
                    
                    Text(viewModel.post?.date.stringDate ?? "00/00/0000")
                }
            }
            .navigationTitle("Title")
        }
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel(postId: 111))
}
