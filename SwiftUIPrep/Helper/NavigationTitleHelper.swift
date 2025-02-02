//
//  NavigationTitleHelper.swift
//  SwiftUIPrep
//
//  Created by Vlad on 2/2/25.
//

import Foundation
import SwiftUI

struct NavigationTitleHelper {
    static func getTitle(for language: String, defaultTitle: String, localizedTitle: String) -> String {
        return language == "en" ? defaultTitle : localizedTitle
    }
    
    static func updateTitle(for language: String, defaultTitle: String, localizedTitle: String, binding: Binding<String>) {
        binding.wrappedValue = getTitle(for: language, defaultTitle: defaultTitle, localizedTitle: localizedTitle)
    }
}
