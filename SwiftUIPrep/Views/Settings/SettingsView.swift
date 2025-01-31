//
//  SettingsView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 30/12/24.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 6) {
                
                // MARK: - Form
                Form {
                    
                    Section {
                        NavigationLink(destination: LanguageSelectionView()) {
                            SelectRowView(icon: "globe", color: .pink, text: "Language") {}
                        }
                    }
                    
                    Section(header: Text("Follow us on social media")) {
                        FormRowLink(icon: "link", color: .accent, text: "Website", link: "https://volos.inc")
                        FormRowLink(icon: "link", color: Color.black, text: "X", link: "https://twitter.com/volos_inc")
                    }
                    
                    Section(header: Text("About the application")) {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "SwiftUIPrep")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "volos.inc")
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Ivanno Ruddio")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0")
                    }
                }// Form
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                // MARK: - Footer
                CopyrightSection()
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                
            }// VStack
            .navigationTitle("Settings")
        }// NavigationStack
    }// Body
}// View

// MARK: - Preview
#Preview {
    SettingsView()
}
