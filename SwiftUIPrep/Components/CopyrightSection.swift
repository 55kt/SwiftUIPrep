//
//  CopyrightSection.swift
//  SwiftUIPrep
//
//  Created by Vlad on 30/1/25.
//

import SwiftUI

struct CopyrightSection: View {
    private let currentYear: String = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy"
            return formatter.string(from: Date())
        }()

        var body: some View {
            Text("Copyright © \(currentYear) volos.inc. All rights reserved.")
                .multilineTextAlignment(.center)
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
}

#Preview {
    CopyrightSection()
}
