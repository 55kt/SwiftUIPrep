//
//  ColorExtension.swift
//  SwiftUIPrep
//
//  Created by Vlad on 5/1/25.
//

import SwiftUI

extension Color {
    init(named name: String) {
        if let uiColor = UIColor(named: name) {
            self.init(uiColor)
        } else {
            self.init(.accent)
            print("❌ Color not found for name: \(name)")
        }
    }
}
