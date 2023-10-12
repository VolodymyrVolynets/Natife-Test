//
//  PostCellView.swift
//  Natife-Test
//
//  Created by Vova on 12/10/2023.
//

import SwiftUI

struct PostCellView: View {
    let post: PostModel
    @State var isShowMore = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .fontWeight(.medium)
            Text(post.previewText)
                .lineLimit(isShowMore ? nil : 2)
            HStack {
                LikesCounter(likesCount: post.likesCount)
                
                Spacer()
                
                Text(post.date.stringDate)
            }
            if (post.previewText.count >= 80) {
                Button {
                    withAnimation() {
                        isShowMore.toggle()
                    }
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.blue)
                            .frame(height: 35)
                        Text(isShowMore ? "Hide" : "Show More")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    let post = PostModel(postId: 1, date: Date(), title: "Hello", previewText: "WorldWorldWorldWoWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWor ldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldrldWorldWorld", likesCount: 123)
    return PostCellView(post: post)
}
