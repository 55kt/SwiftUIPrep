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
    @AppStorage("AppLanguage") private var appLanguage: String?
    
    let currentYear: String = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy"
            return formatter.string(from: Date())
        }()
    
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
                                .frame(width: 150, height: 150, alignment: .center)
                            
                            Text("SwiftUIPrep")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                            
                            Text("Your guide to mastering SwiftUI interviews.")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            
                            Spacer()
                            
                            Text("Copyright © \(currentYear) volos.inc. All rights reserved.")
                                .font(.footnote)
                                .foregroundStyle(.gray.opacity(0.7))
                                .padding(.bottom, 20)
                        }// VStack
                    }// ZStack
                    .environment(\.locale, .init(identifier: appLanguage ?? "en"))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
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
}
