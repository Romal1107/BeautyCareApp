import Foundation

final class APIClient: APIClientProtocol {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Decodable>(
        _ endpoint: APIEndpoint
    ) async throws -> T {
        
        guard let url = endpoint.url else {
            throw NetworkError.inValidURL
        }
        
        do {
            let (data, response) = try await session.data(
                from: url
            )
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.serverError(
                    statusCode: httpResponse.statusCode
                )
            }
            
            guard !data.isEmpty else {
                throw NetworkError.emptyData
            }
            
            do {
                let decoder = JSONDecoder()
                
                return try decoder.decode(
                    T.self,
                    from: data
                )
            } catch {
                throw NetworkError.decodingError
            }
            
        } catch let error as NetworkError {
            throw error
            
        } catch let error as URLError {
            if error.code == .notConnectedToInternet ||
                error.code == .networkConnectionLost {
                throw NetworkError.noInternet
            }
            
            throw NetworkError.unknown(error)
            
        } catch {
            throw NetworkError.unknown(error)
        }
    }
}
