//Created for BeautyCareApp in 2026
// Using Swift 6.0

import Foundation

struct CategoryResponse: Codable {
    let status: Bool
    let message: String
    let data: [Category]?
}

struct Category : Codable,Identifiable {
    let id: String
    let applicationId: String
    let categoryName: String
    let image: String
    let audioFile: String
    let language: [CategoryLanguage]
    
    enum CodingKeys: String, CodingKey {
        case id
        case applicationId = "applicationid"
        case categoryName = "category_name"
        case image
        case audioFile = "audio_file"
        case language
    }
}

struct CategoryLanguage: Codable {
    let languageName: String
    let name: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case languageName = "language_name"
        case name
        case description
    }
}
