//
//  ViewModel.swift
//  Natife-Test
//
//  Created by Vova on 12/10/2023.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    @Published var showDetailed = false
    @Published var detailedPostId = -1
    private var sortType: SortType = .none
    
    init() {
        fetchPosts()
    }
    
    private func fetchPosts() {
        NetworkManager.shared.getRequest(stringURL: "https://raw.githubusercontent.com/anton-natife/jsons/master/api/main.json") { (result: Result<MultiplePostsModel, Error>) in
            switch result {
            case .success(let multiplePosts):
                DispatchQueue.main.async {
                    self.posts = multiplePosts.posts
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    public func sortButtonPressed() {
        sortType = sortType.next()
        
        withAnimation() {
            switch(sortType) {
            case .none:
                posts.sort(by: {$0.postId < $1.postId})
            case .date:
                posts.sort(by: {$0.date.timeIntervalSince1970 > $1.date.timeIntervalSince1970})
            case .likes:
                posts.sort(by: {$0.likesCount > $1.likesCount})
            }
        }
    }
    
    public func showDetailedView(postId: Int) {
        detailedPostId = postId
        showDetailed = true
    }
    
    private enum SortType: CaseIterable {
        case none, date, likes
        func next() -> SortType {
            guard let currentIndex = SortType.allCases.firstIndex(of: self) else {
                fatalError("Enum not found in allCases")
            }
            let nextIndex = (currentIndex + 1) % SortType.allCases.count
            return SortType.allCases[nextIndex]
        }
    }
}
