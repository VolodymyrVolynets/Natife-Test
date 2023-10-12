//
//  DetailView.swift
//  Natife-Test
//
//  Created by Vova on 12/10/2023.
//

import SwiftUI

struct DetailView: View {
    let id: Int
    var body: some View {
        Text("Hello, World! \(id)")
    }
}

#Preview {
    DetailView(id: 1)
}
