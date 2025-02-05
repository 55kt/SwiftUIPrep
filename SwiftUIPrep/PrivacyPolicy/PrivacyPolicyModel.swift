//
//  PrivacyPolicyModel.swift
//  SwiftUIPrep
//
//  Created by Vlad on 5/2/25.
//

import Foundation

struct PrivacyPolicy: Codable {
    let title: String
    let sections: [PrivacyPolicySection]
}

struct PrivacyPolicySection: Codable {
    let header: String
    let content: String
}
