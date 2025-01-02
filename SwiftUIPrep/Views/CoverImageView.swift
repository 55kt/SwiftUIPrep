//
//  CoverImageView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 1/1/25.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - Properties
    let coverImages: [CoverImage] = JSONLoader.loadCovers()
    
    // MARK: - Body
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }// ForEach
        }// TabView
        .tabViewStyle(PageTabViewStyle())
    }// Body
}// View

// MARK: - Preview
#Preview {
    CoverImageView()
}
