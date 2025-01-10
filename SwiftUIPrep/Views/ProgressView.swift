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
            Text("Suspendisse justo elit, consectetur ac posuere in, egestas quis neque. In hac habitasse platea dictumst. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin ac nisl sit amet risus luctus convallis non et magna. Mauris imperdiet, purus vel malesuada ultrices, lectus risus efficitur mauris, id tincidunt diam mi eu mi. Sed et pellentesque diam. Proin ut quam vel nisi vestibulum interdum sed ac leo. Mauris finibus, erat et ullamcorper sollicitudin, risus elit dictum diam, at mollis justo dolor ut mi. Quisque ornare interdum sapien, eget vulputate nulla pellentesque nec. Aliquam euismod erat non tempus malesuada. Morbi imperdiet dictum tristique. Duis id elementum dui. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec ac elit in sem luctus accumsan id at ligula. Cras elementum enim ipsum, in bibendum lorem rutrum et.")
                .padding()
                .multilineTextAlignment(.center)
        }// ScrollView
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }// Body
}// View

// MARK: - Preview
#Preview {
    ProgressView()
}
