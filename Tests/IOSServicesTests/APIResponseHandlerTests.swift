//
//  APIResponseHandlerTests.swift
//  CalixIOSServiceTests
//
//  Created by Om Prakash Tripathi on 24/06/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import XCTest
@testable import IOSServices

internal final class APIResponseHandlerTests: XCTestCase {
    private struct MockData: Decodable, Equatable {
        let id: Int
        let name: String
    }

    func testGetResponseSuccessfullyDecodesData() throws {
        let json = """
        {
            "id": 1,
            "name": "Test"
        }
        """
        let jsonData = Data(json.utf8)

        let handler = APIResponseHandler()
        let result: MockData = try handler.getResponse(from: jsonData)

        XCTAssertEqual(result, MockData(id: 1, name: "Test"))
    }

    func testGetResponseThrowsErrorForInvalidData() {
        let invalidJson = """
        {
            "id": "one",
            "name": "Test"
        }
        """
        let jsonData = Data(invalidJson.utf8)
        let handler = APIResponseHandler()

        XCTAssertThrowsError(try handler.getResponse(from: jsonData) as MockData) { error in
            XCTAssertTrue(error is DecodingError)
        }
    }

    func testCustomDecoder() throws {
        struct CustomDateMockData: Decodable, Equatable {
            let date: Date
        }

        let stringJson = """
        {
            "date": "2024-07-24T12:00:00Z"
        }
        """
        let jsonData = Data(stringJson.utf8)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let customDecoder = JSONDecoder()
        customDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        let handler = APIResponseHandler(decoder: customDecoder)
        let result: CustomDateMockData = try handler.getResponse(from: jsonData)
        let mockDate = try XCTUnwrap(dateFormatter.date(from: "2024-07-24T12:00:00Z"))

        XCTAssertEqual(result, CustomDateMockData(date: mockDate))
    }
}
