//
//  SettingsView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 30/12/24.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Properties
    @AppStorage("AppLanguage") private var currentLanguage: String = Locale.current.language.languageCode?.identifier ?? "en"
    @State private var navigationTitle: String = ""
    @State private var isShowingSheet: Bool = false
    @State private var isWebsiteAlertPresented: Bool = false
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 6) {
                Form {
                    
                    Section {
                        NavigationLink(destination: LanguageSelectionView(currentLanguage: $currentLanguage)) {
                            SelectRowView(icon: "globe", color: .pink, text: "Language") {}
                        }
                    }// SelectedRow Section
                    
//                    Section(header: Text("Follow us on social media")) {
//                        FormRowLink(icon: "link", color: .accent, text: "Website", link: "https://volos.inc")
//                        FormRowLink(icon: "link", color: Color.black, text: "X", link: "https://twitter.com/volos_inc")
//                    }// FormRowLink Section
                    
                    Section(header: Text("About the application")) {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "SwiftUIPrep", rectangleFillColor: .purple)
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone", rectangleFillColor: .green)
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Volos Software LLC", rectangleFillColor: .orange)
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Ivanno Ruddio", rectangleFillColor: .pink)
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0", rectangleFillColor: .blue)
                    }// FormRowStatic Section
                    
                    // MARK: - Footer
                    Section {
                        VStack {
                            Button {
                                isShowingSheet.toggle()
                            } label: {
                                Text("Privacy and Policy")
                                    .foregroundStyle(.blue)
                            }
                            .padding()
                            .sheet(isPresented: $isShowingSheet) {
                                PrivacyAndPolicyView()
                            }
                            
                            CopyrightSection()
                                .padding(.top, 6)
                                .padding(.bottom, 8)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    }// Section
                }// Form
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                
            }// VStack
            .navigationTitle(navigationTitle)
            .onAppear {
                NavigationTitleHelper.updateTitle(
                    for: currentLanguage,
                    key: "settings",
                    binding: $navigationTitle
                )
            }
            .onChange(of: currentLanguage) { _ in
                NavigationTitleHelper.updateTitle(
                    for: currentLanguage,
                    key: "settings",
                    binding: $navigationTitle
                )
            }
        }// NavigationStack
    }// Body
}// View

// MARK: - Preview
#Preview {
    SettingsView()
}
