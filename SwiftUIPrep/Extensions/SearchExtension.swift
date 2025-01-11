//
//  SearchExtension.swift
//  SwiftUIPrep
//
//  Created by Vlad on 11/1/25.
//

import SwiftUI

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
