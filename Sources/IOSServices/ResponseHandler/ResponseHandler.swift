//
// ResponseHandler.swift
// CalixIOSService
//
// Created by Om Prakash Tripathi on 24/06/24.
// Copyright © 2024 Calix Inc. All rights reserved.
//
import Foundation
// MARK: - ResponseHandler

/// A protocol for handling and decoding API responses.
public protocol ResponseHandler {
  /// Decodes the given data into a specified decodable type.
  ///
  /// - Parameter response: The data to be decoded.
  /// - Returns: An object of type `T` that conforms to `Decodable`.
  /// - Throws: An error if the data cannot be decoded into the specified type.
  func getResponse<T: Decodable>(from response: Data) throws -> T
}
