//
//  TestViewsButton.swift
//  SwiftUIPrep
//
//  Created by Vlad on 14/1/25.
//

import SwiftUI

struct TestViewsButton: View {
    var buttonName: LocalizedStringKey = "Test Views Button"
    var action: () -> ()
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(buttonName)
                .font(.title)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.accent)
                .foregroundColor(.primary)
                .cornerRadius(25)
        }
        .padding(.top)
    }
}

#Preview {
    TestViewsButton() {}
}
