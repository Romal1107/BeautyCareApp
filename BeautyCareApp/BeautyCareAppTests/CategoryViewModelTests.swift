//Created for BeautyCareApp in 2026
// Using Swift 6.0

import Foundation
import XCTest
@testable import BeautyCareApp

@MainActor
final class CategoryViewModelTests: XCTestCase {

    func testLoadCategoriesSuccess() async {

        let json = """
        {
            "status": true,
            "message": "Success",
            "data": [
                {
                    "id": "1",
                    "applicationid": "19",
                    "category_name": "REMEDY",
                    "image": "https://example.com/image.jpg",
                    "audio_file": "",
                    "language": [
                        {
                            "language_name": "English",
                            "name": "Home Remedies",
                            "description": "Beauty care remedies"
                        }
                    ]
                }
            ]
        }
        """

        let mockResult: Result<Data, Error> = .success(
            Data(json.utf8)
        )

        let mockClient = MockAPIClient(
            result: mockResult
        )

        let viewModel = CategoryViewModel(
            apiClient: mockClient
        )

        await viewModel.loadCategories(
            applicationId: "19"
        )

        switch viewModel.state {

        case .loaded(let categories):
            XCTAssertEqual(categories.count, 1)
            XCTAssertEqual(categories.first?.id, "1")
            XCTAssertEqual(
                categories.first?.categoryName,
                "REMEDY"
            )

        default:
            XCTFail("Expected loaded state")
        }
    }
}

@MainActor
extension CategoryViewModelTests {

    func testLoadCategoriesFailure() async {

        let mockClient = MockAPIClient(
            result: .failure(
                MockAPIClient.MockError.failed
            )
        )

        let viewModel = CategoryViewModel(
            apiClient: mockClient
        )

        await viewModel.loadCategories(
            applicationId: "19"
        )

        switch viewModel.state {

        case .failed:
            XCTAssertTrue(true)

        default:
            XCTFail(
                "Expected failed state"
            )
        }
    }
}
