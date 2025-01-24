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

extension Color {
    static let gold = Color(red: 212/255, green: 175/255, blue: 55/255)
    static let silver = Color(red: 192/255, green: 192/255, blue: 192/255)
    static let bronze = Color(red: 205/255, green: 127/255, blue: 50/255) 
}
