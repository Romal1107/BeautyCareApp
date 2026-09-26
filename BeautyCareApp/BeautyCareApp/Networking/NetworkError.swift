//Created for BeautyCareApp in 2026
// Using Swift 6.0

import Foundation

enum NetworkError: LocalizedError {
    case inValidURL
    case noInternet
    case invalidResponse
    case serverError(statusCode: Int)
    case decodingError
    case emptyData
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .inValidURL:
            return "Invalid URL"
        case .noInternet:
            return "No Internet Connection"
        case .invalidResponse:
            return "Invalid Response"
        case .serverError(statusCode: let code):
            return "Server Error (\(code))"
        case .decodingError:
            return "Decoding Error"
        case .emptyData:
            return "Empty Data"
        case .unknown(let underlyingError):
            return "Unknown Error: \(underlyingError.localizedDescription)"
        }
    }
}
