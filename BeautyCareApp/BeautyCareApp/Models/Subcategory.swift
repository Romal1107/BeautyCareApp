//Created for BeautyCareApp in 2026
// Using Swift 6.0

import Foundation
struct SubcategoryResponse: Codable {
    let status: Bool
    let message: String
    let data: [Subcategory]?
}

struct Subcategory: Codable, Identifiable {
    let id: String
    let applicationId: String
    let categoryId: String
    let subcategoryName: String
    let image: String
    let language: [SubcategoryLanguage]

    enum CodingKeys: String, CodingKey {
        case id
        case applicationId = "applicationid"
        case categoryId = "categoryid"
        case subcategoryName = "subcategory_name"
        case image
        case language
    }
}

struct SubcategoryLanguage: Codable {
    let languageName: String
    let name: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case languageName = "language_name"
        case name
        case description
    }
}
