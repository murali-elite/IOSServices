//
//  APIResponseHandler.swift
//  CalixIOSService
//
//  Created by Om Prakash Tripathi on 24/06/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import Foundation
import Alamofire
// MARK: - APIResponseHandler

/// `SSLPinningError` defines errors related to SSL pinning validation.
///
/// This enum conforms to the `Error` and `LocalizedError` protocols, allowing it to be used as a standard error type
/// in Swift and providing a localized description of the error.
public enum SSLPinningError: Error, LocalizedError {
    /// The error case indicating that SSL pinning validation has failed.
    case pinValidationFailed

    /// A localized description of the SSL pinning error.
    ///
    /// This property provides a user-friendly description of the error,
    /// which can be used for logging or displaying an error message to the user.
    public var errorDescription: String? {
        switch self {
        case .pinValidationFailed:
            return "SSL pinning validation failed. The server's certificate is not trusted."
        }
    }
}

/// `APIResponseHandler` is a struct responsible for handling API responses and decoding them into specified types.
///
/// This struct conforms to the `ResponseHandler` protocol and provides functionality to decode raw data into a
/// strongly-typed object using a `JSONDecoder`.
public struct APIResponseHandler: ResponseHandler {
    let decoder: JSONDecoder

    /// Initializes a new `APIResponseHandler` with the given JSON decoder.
    ///
    /// - Parameter decoder: The JSON decoder to be used for decoding responses. Defaults to `JSONDecoder()`.
    public init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }

    /// Decodes the given data into a specified decodable type.
    ///
    /// - Parameter data: The data to be decoded.
    /// - Returns: An object of type `T` that conforms to `Decodable`.
    /// - Throws: An error if the data cannot be decoded into the specified type.
    public func getResponse<T: Decodable>(from data: Data) throws -> T {
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw error
        }
    }
}
