//
//  PostCellView.swift
//  Natife-Test
//
//  Created by Vova on 12/10/2023.
//

import SwiftUI

struct PostCellView: View {
    let post: PostModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .fontWeight(.medium)
            Text(post.previewText)
                .lineLimit(2)
            HStack {
                LikesCounter(likesCount: post.likesCount)
                
                Spacer()
                
                Text(post.date.stringDate)
            }
        }
    }
}

#Preview {
    let post = PostModel(postId: 1, date: Date(), title: "Hello", previewText: "WorldWorldWorldWoWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWor ldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldrldWorldWorld", likesCount: 123)
    return PostCellView(post: post)
}
