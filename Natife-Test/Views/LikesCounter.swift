//
//  LikesCounter.swift
//  Natife-Test
//
//  Created by Vova on 12/10/2023.
//

import SwiftUI

struct LikesCounter: View {
    let likesCount: Int
    var body: some View {
        HStack(spacing: 3) {
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
            Text("\(likesCount)")
        }
    }
}

#Preview {
    LikesCounter(likesCount: 100)
}
