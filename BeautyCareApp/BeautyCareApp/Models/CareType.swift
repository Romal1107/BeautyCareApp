//Created for BeautyCareApp in 2026
// Using Swift 6.0

import Foundation

struct CareType: Identifiable {
    let id: String
    let name: String
    let applicationId: String
    let imageName: String
}

extension CareType {
    static let all : [CareType] = [
        CareType(id: "face", name: "Face Care", applicationId: "19", imageName: "face"),
        CareType(id: "hair", name: "Hair Care", applicationId: "21", imageName: "hair"),
        CareType(id: "eye", name: "Eye Care", applicationId: "22", imageName: "eye"),
        CareType(id: "lips", name: "Lips Care", applicationId: "23", imageName: "lips"),
        CareType(id: "teeth", name: "Teeth Care", applicationId: "24", imageName: "teeth"),
        CareType(id: "nail", name: "Nail Care", applicationId: "25", imageName: "nail"),
        CareType(id: "hand", name: "Hand Care", applicationId: "28", imageName: "hand"),
        CareType(id: "leg", name: "Leg Care", applicationId: "29", imageName: "leg")
    ]
}
