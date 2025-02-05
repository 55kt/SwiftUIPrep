//
//  PrivacyAndPolicyView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 5/2/25.
//

import SwiftUI

struct PrivacyAndPolicyView: View {
    // MARK: - Properties
    @AppStorage("AppLanguage") private var appLanguage: String = Locale.current.language.languageCode?.identifier ?? "en"
    @Environment(\.dismiss) var dismiss
    @StateObject private var loader = PrivacyPolicyLoader()
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    if let privacyPolicy = loader.privacyPolicy {
                        Text(privacyPolicy.title)
                            .font(.title2)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        ForEach(privacyPolicy.sections, id: \.header) { section in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(section.header)
                                    .font(.headline)
                                    .foregroundStyle(.accent)
                                Text(section.content)
                                    .font(.body)
                                    .foregroundColor(.primary)
                            }// VStack
                        }// ForEach
                    } else {
                        ProgressView()
                    }// if - else
                }// VStack
                .padding()
            }// ScrollView
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                }// ToolbarItem
            }// Toolbar
        }// NavigationStack
        .onAppear {
            loader.loadPrivacyPolicy(for: appLanguage)
        }// onAppear
    }// Body
}// View

// MARK: - Preview
#Preview {
    PrivacyAndPolicyView()
}
