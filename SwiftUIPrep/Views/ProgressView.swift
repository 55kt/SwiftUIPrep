//
//  ProgressView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 1/1/25.
//

import SwiftUI

struct ProgressView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
        }// ScrollView
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }// Body
}// View

// MARK: - Preview
#Preview {
    ProgressView()
}
