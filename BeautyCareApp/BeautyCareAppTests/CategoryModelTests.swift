//Created for BeautyCareApp in 2026
// Using Swift 6.0

import Foundation
import XCTest
@testable import BeautyCareApp

final class CategoryModelTests: XCTestCase {

    func testCategoryResponseDecoding() throws {

        let json = """
        {
            "status": true,
            "message": "Category list",
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

        let data = Data(json.utf8)

        let response = try JSONDecoder().decode(
            CategoryResponse.self,
            from: data
        )

        XCTAssertTrue(response.status)
        XCTAssertEqual(response.data?.count, 1)
        XCTAssertEqual(response.data?.first?.id, "1")
        XCTAssertEqual(
            response.data?.first?.applicationId,
            "19"
        )
        XCTAssertEqual(
            response.data?.first?.categoryName,
            "REMEDY"
        )
        XCTAssertEqual(
            response.data?.first?.language.first?.name,
            "Home Remedies"
        )
    }
}
