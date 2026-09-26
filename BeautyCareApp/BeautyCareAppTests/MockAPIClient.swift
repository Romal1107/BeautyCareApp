import Foundation
@testable import BeautyCareApp

final class MockAPIClient: APIClientProtocol {

    enum MockError: Error {
        case failed
    }

    var result: Result<Data, Error>

    init(result: Result<Data, Error>) {
        self.result = result
    }

    func request<T: Decodable>(
        _ endpoint: APIEndpoint
    ) async throws -> T {

        let data = try result.get()

        return try JSONDecoder().decode(
            T.self,
            from: data
        )
    }
}
