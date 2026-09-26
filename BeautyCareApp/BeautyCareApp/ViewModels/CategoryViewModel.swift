//Created for BeautyCareApp in 2026
// Using Swift 6.0

import Foundation
import SwiftUI

@MainActor
final class CategoryViewModel: ObservableObject {
    
    enum State{
        case idle
        case loading
        case loaded([Category])
        case empty
        case failed(String)
    }
    
    @Published private(set) var state: State = .idle
    
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
    
    func loadCategories(applicationId:String) async {
        //state = .loading
        
        do {
            let response: CategoryResponse = try await apiClient.request(
                .categories(applicationId: applicationId)
            )
            
            guard response.status else {
                state = .failed(response.message)
                return
            }
            
            guard let categories = response.data,
                  !categories.isEmpty else {
                state = .empty
                return
            }
            state = .loaded(categories)
            
        }catch {
            state = .failed(error.localizedDescription)
        }
    }
    
    func retry(applicationId:String) async {
        await loadCategories(applicationId: applicationId)
    }
}
