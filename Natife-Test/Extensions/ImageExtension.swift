//
//  ImageExtension.swift
//  Natife-Test
//
//  Created by Vova on 12/10/2023.
//

import SwiftUI

extension Image {
    func data(url: URL) -> Self {
        if let data = try? Data(contentsOf: url) {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        }
        return self
            .resizable()
    }
}
