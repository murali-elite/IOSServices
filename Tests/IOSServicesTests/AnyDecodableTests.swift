//
//  AnyDecodableTests.swift
//  CalixIOSServiceTests
//
//  Created by Om Prakash Tripathi on 24/06/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import XCTest
@testable import IOSServices

internal final class AnyDecodableTests: XCTestCase {
    func testDecodeBool() throws {
        let json = """
        true
        """
        let jsonData = Data(json.utf8)

        let decoded = try JSONDecoder().decode(AnyDecodable.self, from: jsonData)

        XCTAssertEqual(decoded.value as? Bool, true)
    }

    func testDecodeInt() throws {
        let json = """
        42
        """
        let jsonData = Data(json.utf8)

        let decoded = try JSONDecoder().decode(AnyDecodable.self, from: jsonData)

        XCTAssertEqual(decoded.value as? Int, 42)
    }

    func testDecodeDouble() throws {
        let json = """
        3.14
        """
        let jsonData = Data(json.utf8)

        let decoded = try JSONDecoder().decode(AnyDecodable.self, from: jsonData)

        XCTAssertEqual(decoded.value as? Double, 3.14)
    }

    func testDecodeString() throws {
        let json = """
        "Hello, world!"
        """
        let jsonData = Data(json.utf8)

        let decoded = try JSONDecoder().decode(AnyDecodable.self, from: jsonData)

        XCTAssertEqual(decoded.value as? String, "Hello, world!")
    }

    func testDecodeArray() throws {
        let json = """
        [1, "two", 3.1, true]
        """
        let jsonData = Data(json.utf8)

        let decoded = try JSONDecoder().decode(AnyDecodable.self, from: jsonData)

        let array = decoded.value as? [Any]
        XCTAssertNotNil(array)
        XCTAssertEqual(array?[0] as? Int, 1)
        XCTAssertEqual(array?[1] as? String, "two")
        XCTAssertEqual(array?[2] as? Double, 3.1)
        XCTAssertEqual(array?[3] as? Bool, true)
    }

    func testDecodeDictionary() throws {
        let json = """
        {
            "key1": 1,
            "key2": "two",
            "key3": 3.1,
            "key4": true
        }
        """
        let jsonData = Data(json.utf8)

        let decoded = try JSONDecoder().decode(AnyDecodable.self, from: jsonData)

        let dictionary = decoded.value as? [String: Any]
        XCTAssertNotNil(dictionary)
        XCTAssertEqual(dictionary?["key1"] as? Int, 1)
        XCTAssertEqual(dictionary?["key2"] as? String, "two")
        XCTAssertEqual(dictionary?["key3"] as? Double, 3.1)
        XCTAssertEqual(dictionary?["key4"] as? Bool, true)
    }

    func testDecodeInvalidData() throws {
        let json = """
        {
            "invalid"
        }
        """
        let jsonData = Data(json.utf8)

        XCTAssertThrowsError(try JSONDecoder().decode(AnyDecodable.self, from: jsonData)) { error in
            guard case DecodingError.dataCorrupted = error else {
                return XCTFail("Expected dataCorrupted error, but got \(error)")
            }
        }
    }
}
