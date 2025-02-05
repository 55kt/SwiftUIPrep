//
//  PrivacyPolicyLoader.swift
//  SwiftUIPrep
//
//  Created by Vlad on 5/2/25.
//

import Foundation

class PrivacyPolicyLoader: ObservableObject {
    @Published var privacyPolicy: PrivacyPolicy?
    
    func loadPrivacyPolicy(for language: String) {
        let fileName = language == "ru" ? "privacy_policy_ru" : "privacy_policy_en"
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let decodedData = try? JSONDecoder().decode(PrivacyPolicy.self, from: data) {
            DispatchQueue.main.async {
                self.privacyPolicy = decodedData
            }
        }
    }
}
