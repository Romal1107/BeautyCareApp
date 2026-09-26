//Created for BeautyCareApp in 2026
// Using Swift 6.0

import Foundation
protocol APIClientProtocol {
 
    func request<T: Decodable>(_ endpoint: APIEndpoint) async throws -> T
                               
}
