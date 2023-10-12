//
//  AsyncImage.swift
//  Natife-Test
//
//  Created by Vova on 12/10/2023.
//

import SwiftUI

struct AsyncImage: View {
    @State private var image: UIImage? = nil
    let url: URL
    
    var body: some View {
        Group {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
            } else {
                // Placeholder
                Image(systemName: "clock")
                    .resizable()
            }
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let loadedImage = UIImage(data: data) {
                image = loadedImage
            }
        }.resume()
    }
}
