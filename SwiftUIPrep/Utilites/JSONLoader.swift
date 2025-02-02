//
//  JSONLoader.swift
//  SwiftUIPrep
//
//  Created by Vlad on 2/1/25.
//

import Foundation

// MARK: - JSON Loader Utility
final class JSONLoader {
    /// Loads and decodes a JSON file into an array of the specified type.
    /// - Parameters:
    ///   - fileName: The name of the JSON file (without extension).
    ///   - fileType: The type of object to decode into, conforming to Decodable.
    /// - Returns: An array of the specified type, or an empty array if an error occurs.
    static func load<T: Decodable>(fileName: String, as fileType: T.Type) -> T? {
        // Locate the JSON file in the app bundle
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("❌ JSON file not found: \(fileName)")
            return nil
        }

        do {
            // Load the JSON file into Data
            let data = try Data(contentsOf: url)

            // Decode the JSON data into the specified type
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            print("✅ Successfully loaded \(fileName) as \(T.self)")
            return decodedData
        } catch let decodingError as DecodingError {
            handleDecodingError(decodingError, fileName: fileName)
        } catch {
            print("❌ Error loading \(fileName): \(error.localizedDescription)")
        }
        return nil
    }

    // MARK: - Specific Loaders
    /// Loads questions based on the provided language.
    /// - Parameter language: The language code to determine the JSON file.
    /// - Returns: An array of `Question` objects, or an empty array if an error occurs.
    static func loadQuestions(for language: String) -> [Question] {
        let fileName = "questions_\(language)"
        return load(fileName: fileName, as: [Question].self) ?? []
    }

    /// Loads cover images from the JSON file.
    /// - Returns: An array of `CoverImage` objects, or an empty array if an error occurs.
//    static func loadCovers() -> [CoverImage] {
//        let fileName = "covers"
//        return load(fileName: fileName, as: [CoverImage].self) ?? []
//    }

    // MARK: - Handle Decoding Error
    private static func handleDecodingError(_ error: DecodingError, fileName: String) {
        switch error {
        case .typeMismatch(let type, let context):
            print("❌ Type mismatch in \(fileName): \(type) - \(context.debugDescription)")
        case .valueNotFound(let value, let context):
            print("❌ Value not found in \(fileName): \(value) - \(context.debugDescription)")
        case .keyNotFound(let key, let context):
            print("❌ Key '\(key)' not found in \(fileName): \(context.debugDescription)")
        case .dataCorrupted(let context):
            print("❌ Data corrupted in \(fileName): \(context.debugDescription)")
        @unknown default:
            print("❌ Unknown decoding error in \(fileName): \(error)")
        }
    }
}
