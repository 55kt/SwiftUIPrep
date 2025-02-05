//
//  LaunchScreenView.swift
//  SwiftUIPrep
//
//  Created by Vlad on 30/12/24.
//

import SwiftUI

struct LaunchScreenView: View {
    // MARK: - Properties
    @State private var isActive: Bool = false
    @AppStorage("AppLanguage") private var appLanguage: String = Locale.current.language.languageCode?.identifier ?? "en"
    @EnvironmentObject var viewModel: QuestionViewModel
    
    // MARK: - Body
    var body: some View {
        if isActive {
                    MainView()
                } else {
                    ZStack {
                        Color.launchScreen
                            .ignoresSafeArea()
                        VStack {
                            Spacer()
                            
                            Image("launch-screen-image")
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 300, maxHeight: 300)
                            
                            Text("SwiftUIPrep")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                            
                            Text("Your guide to mastering SwiftUI interviews.")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            
                            Spacer()
                            
                            CopyrightSection()
                                .padding(.bottom, 20)
                        }// VStack
                    }// ZStack
                    .environment(\.locale, .init(identifier: appLanguage))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation {
                                self.isActive = true
                            }
                        }// DispatchQueue
                    }// OnAppear
                }// if - else
    }// Body
}// View

// MARK: - Preview
#Preview {
    LaunchScreenView()
        .environmentObject(QuestionViewModel())
}
