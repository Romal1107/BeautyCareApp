//Created for BeautyCareApp in 2026
// Using Swift 6.0

import Foundation

enum APIEndpoint {
    case categories(applicationId: String)
    case subcategories(applicationId: String, categoryId: String)
    
    private var baseURL: String {
        "https://mobilehubs.website/appmanagement123/api"
    }
    
    private var path: String {
        switch self {
        case .categories:
            return "/getcategory"
        case .subcategories:
            return "/getsubcategory"
        }
    }
    
    private var queryItems: [URLQueryItem] {
        switch self {
        case .categories(let applicationId):
            return [
                URLQueryItem(name: "applicationid", value: applicationId)]
            
        case .subcategories(let applicationId, let categoryId):
            return [
                URLQueryItem(name: "applicationid", value: applicationId),
                URLQueryItem(name: "categoryid", value: categoryId)
            ]
        }
    }
    
    var url: URL? {
        var components = URLComponents(
            string: baseURL + path
        )
        components?.queryItems = queryItems
        return components?.url
    }
}
