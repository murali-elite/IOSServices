//
//  File.swift
//  
//
//  Created by Ranjith Kumar on 25/07/24.
//

import Foundation
// MARK: - APIResponseHandler

/// A handler for decoding API responses.
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
