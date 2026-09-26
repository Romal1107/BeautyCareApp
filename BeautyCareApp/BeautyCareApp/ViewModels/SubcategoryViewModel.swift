//Created for BeautyCareApp in 2026
// Using Swift 6.0

import Foundation
import SwiftUI

@MainActor
final class SubcategoryViewModel: ObservableObject {
    
    enum State{
        case idle
        case loading
        case loaded([Subcategory])
        case empty
        case failed(String)
    }
    
    @Published private(set) var state: State = .idle
    
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }
    
    func loadSubcategories(applicationId:String,categoryId:String) async {
        state = .loading
        
        do {
            let response: SubcategoryResponse = try await apiClient.request(
                .subcategories(applicationId: applicationId,categoryId: categoryId)
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
    
    func retry(applicationId:String,categoryId:String) async {
        await loadSubcategories(applicationId: applicationId, categoryId: categoryId)
    }
}
