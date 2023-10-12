//
//  PostCellView.swift
//  Natife-Test
//
//  Created by Vova on 12/10/2023.
//

import SwiftUI

struct PostCellView: View {
    let post: PostModel
    var stringDate: String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/MM/YYYY"
        return dateFormater.string(from: post.date)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .fontWeight(.medium)
            Text(post.previewText)
                .lineLimit(2)
            HStack {
                HStack(spacing: 3) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                    Text("\(post.likesCount)")
                }
                
                Spacer()
                
                Text(stringDate)
            }
        }
    }
}

#Preview {
    let post = PostModel(postId: 1, date: Date(), title: "Hello", previewText: "WorldWorldWorldWoWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWor ldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldWorldrldWorldWorld", likesCount: 123)
    return PostCellView(post: post)
}
