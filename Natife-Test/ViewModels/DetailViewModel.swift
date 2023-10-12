//
//  ViewModel.swift
//  Natife-Test
//
//  Created by Vova on 12/10/2023.
//

import SwiftUI

class DetailViewModel: ObservableObject {
    let postId: Int
    @Published var post: DetailPostModel?
    @Published var isLoading = true
    
    init(postId: Int) {
        self.postId = postId
        fetchPost()
    }
    
    private func fetchPost() {
        NetworkManager.shared.getRequest(stringURL: "https://raw.githubusercontent.com/anton-natife/jsons/master/api/posts/\(postId).json") { (result: Result<DetailPostContainer, Error>) in
            switch result {
            case .success(let post):
                DispatchQueue.main.async {
                    self.post = post.post
                    self.isLoading = false
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
