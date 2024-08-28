//
//  NetworkManagerTests.swift
//  CalixIOSServiceTests
//
//  Created by Om Prakash Tripathi on 24/06/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import XCTest
import Alamofire
import Foundation
import OHHTTPStubs
import OHHTTPStubsSwift
@testable import IOSServices

internal class NetworkManagerTests: XCTestCase {
    // swiftlint:disable implicitly_unwrapped_optional
    private var networkManager: NetworkManager!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        super.setUp()
        networkManager = NetworkManager(session: Session.default)
    }

    override func tearDown() {
        networkManager = nil
        HTTPStubs.removeAllStubs()
        super.tearDown()
    }

    func testRequestJSONSuccess() async {
        // Stub the network request
        stub(condition: isHost("api.example.com")) { _ in
            let stringJson = """
            { "key": "value" }
            """
            let stubData = Data(stringJson.utf8)

            return HTTPStubsResponse(data: stubData, statusCode: 200, headers: ["Content-Type": "application/json"])
        }

        do {
            let response = try await networkManager.requestJSON("https://api.example.com")
            XCTAssertNotNil(response)
            if let json = response as? [String: Any] {
                XCTAssertEqual(json["key"] as? String, "value")
            } else {
                XCTFail("Response is not a JSON object")
            }
        } catch {
            XCTFail("Request failed with error: \(error)")
        }
    }

    func testRequestDataFailure() async {
        // Stub the network request to simulate a failure
        stub(condition: isHost("api.example.com")) { _ in
            HTTPStubsResponse(error: NSError(domain: NSURLErrorDomain,
                                             code: NSURLErrorNotConnectedToInternet,
                                             userInfo: nil))
        }

        do {
            _ = try await networkManager.requestData("https://api.example.com")
            XCTFail("Request should have failed")
        } catch {
            XCTAssertNotNil(error)
        }
    }

    func testRequestDecodableSuccess() async {
        // Stub the network request
        stub(condition: isHost("api.example.com")) { _ in
            let stringJson = """
            { "id": 1, "name": "John Doe" }
            """
            let stubData = Data(stringJson.utf8)

            return HTTPStubsResponse(data: stubData, statusCode: 200, headers: ["Content-Type": "application/json"])
        }

        struct User: Decodable {
            let id: Int
            let name: String
        }

        do {
            let user: User = try await networkManager.requestDecodable("https://api.example.com")
            XCTAssertEqual(user.id, 1)
            XCTAssertEqual(user.name, "John Doe")
        } catch {
            XCTFail("Request failed with error: \(error)")
        }
    }

    func testUploadDataSuccess() async {
        let stringJson = "response data"
        let stubData = Data(stringJson.utf8)

        // Stub the network request
        stub(condition: isHost("api.example.com")) { _ in
            HTTPStubsResponse(data: stubData,
                              statusCode: 200,
                              headers: ["Content-Type": "text/plain"])
        }

        let dataToUploadString = "test data"
        let dataToUpload = Data(dataToUploadString.utf8)

        do {
            let responseData = try await networkManager.uploadData("https://api.example.com", data: dataToUpload)
            XCTAssertEqual(responseData, stubData)
        } catch {
            XCTFail("Request failed with error: \(error)")
        }
    }

    func testUploadMultipartFormDataSuccess() async {
            // Stub the network request
            stub(condition: isHost("api.example.com")) { _ in
                let stringJson = "multipart response data"
                let stubData = Data(stringJson.utf8)

                return HTTPStubsResponse(data: stubData, statusCode: 200, headers: ["Content-Type": "text/plain"])
            }

            do {
                let responseData = try await networkManager.uploadMultipartFormData("https://api.example.com") { formData in
                    let testString = "test data"
                    let testData = Data(testString.utf8)
                    formData.append(testData,
                                    withName: "file",
                                    fileName: "file.txt",
                                    mimeType: "text/plain")
                }
                XCTAssertEqual(String(decoding: responseData, as: UTF8.self), "multipart response data")
            } catch {
                XCTFail("Request failed with error: \(error)")
            }
        }

        func testDownloadDataSuccess() async {
            // Stub the network request
            stub(condition: isHost("api.example.com")) { _ in
                let stringJson = "downloaded data"
                let stubData = Data(stringJson.utf8)

                let destinationURL = FileManager.default.temporaryDirectory.appendingPathComponent("downloadedFile.txt")
                try? stubData.write(to: destinationURL)
                return HTTPStubsResponse(fileAtPath: destinationURL.path,
                                         statusCode: 200,
                                         headers: ["Content-Type": "text/plain"])
            }

            do {
                let fileURL = try await networkManager.downloadData("https://api.example.com")
                let fileContents = try String(contentsOf: fileURL, encoding: .utf8)
                XCTAssertEqual(fileContents, "downloaded data")
            } catch {
                XCTFail("Request failed with error: \(error)")
            }
        }

    // Additional tests for other methods can be written similarly
}
