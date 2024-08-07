//
// NetworkManager.swift
// CalixIOSService
//
// Created by Om Prakash Tripathi on 24/06/24.
// Copyright © 2024 Calix Inc. All rights reserved.
//

import Foundation
import Alamofire
/// A manager for handling network requests, conforming to the `NetworkHandler` protocol.
public struct NetworkManager: NetworkHandler {
  private var session: SessionProtocol

  /// Initializes a new `NetworkManager` with the given session.
  ///
  /// - Parameter session: The session to be used for network requests. Defaults to `Session.default`.
  public init(session: SessionProtocol = Session.default) {
    self.session = session
  }

  /// Performs an HTTP request and returns the response as a JSON object.
  ///
  /// - Parameters:
  ///  - url: The endpoint URL as a string.
  ///  - method: The HTTP method. Defaults to `.get`.
  ///  - parameters: Optional parameters to be included in the request.
  ///  - headers: Optional headers to be included in the request.
  /// - Returns: A JSON object (`Any`).
  /// - Throws: An error if the request fails.
  public func requestJSON(_ url: String,
              method: HTTPMethod = .get,
              parameters: Parameters? = nil,
              headers: HTTPHeaders? = nil) async throws -> Any {
    try await withCheckedThrowingContinuation { continuation in
      session.request(url,
              method: method,
              parameters: parameters,
              encoding: URLEncoding.default,
              headers: headers).responseDecodable(of: AnyDecodable.self) { response in
        switch response.result {
        case .success(let json):
          continuation.resume(returning: json.value)

        case .failure(let error):
          continuation.resume(throwing: error)
        }
      }
    }
  }

  /// Performs an HTTP request and returns the response as raw data.
  ///
  /// - Parameters:
  ///  - url: The endpoint URL as a string.
  ///  - method: The HTTP method. Defaults to `.get`.
  ///  - parameters: Optional parameters to be included in the request.
  ///  - headers: Optional headers to be included in the request.
  /// - Returns: The response data.
  /// - Throws: An error if the request fails.
  public func requestData(_ url: String,
              method: HTTPMethod = .get,
              parameters: Parameters? = nil,
              headers: HTTPHeaders? = nil) async throws -> Data {
    try await withCheckedThrowingContinuation { continuation in
      session.request(url,
              method: method,
              parameters: parameters,
              encoding: URLEncoding.default,
              headers: headers).responseDecodable(of: Data.self) { response in
        switch response.result {
        case .success(let data):
          continuation.resume(returning: data)

        case .failure(let error):
          continuation.resume(throwing: error)
        }
      }
    }
  }

  /// Performs an HTTP request and returns the response as a decodable object.
  ///
  /// - Parameters:
  ///  - url: The endpoint URL as a string.
  ///  - method: The HTTP method. Defaults to `.get`.
  ///  - parameters: Optional parameters to be included in the request.
  ///  - headers: Optional headers to be included in the request.
  /// - Returns: A decodable object of type `T`.
  /// - Throws: An error if the request fails.
  public func requestDecodable<T: Decodable>(_ url: String,
                        method: HTTPMethod = .get,
                        parameters: Parameters? = nil,
                        headers: HTTPHeaders? = nil) async throws -> T {
    try await withCheckedThrowingContinuation { continuation in
      session.request(url,
              method: method,
              parameters: parameters,
              encoding: URLEncoding.default,
              headers: headers).responseDecodable(of: T.self) { response in
        switch response.result {
        case .success(let data):
          continuation.resume(returning: data)

        case .failure(let error):
          continuation.resume(throwing: error)
        }
      }
    }
  }

  /// Uploads data to the specified URL.
  ///
  /// - Parameters:
  ///  - url: The endpoint URL as a string.
  ///  - data: The data to be uploaded.
  ///  - method: The HTTP method. Defaults to `.post`.
  ///  - headers: Optional headers to be included in the request.
  /// - Returns: The response data.
  /// - Throws: An error if the request fails.
  public func uploadData(_ url: String,
              data: Data,
              method: HTTPMethod = .post,
              headers: HTTPHeaders? = nil) async throws -> Data {
    try await withCheckedThrowingContinuation { continuation in
      session.upload(data, to: url, method: method, headers: headers).responseData { response in
        switch response.result {
        case .success(let data):
          continuation.resume(returning: data)

        case .failure(let error):
          continuation.resume(throwing: error)
        }
      }
    }
  }

  /// Uploads multipart form data to the specified URL.
  ///
  /// - Parameters:
  ///  - url: The endpoint URL as a string.
  ///  - multipartFormData: A closure that appends data to the multipart form data.
  ///  - method: The HTTP method. Defaults to `.post`.
  ///  - headers: Optional headers to be included in the request.
  /// - Returns: The response data.
  /// - Throws: An error if the request fails.
  public func uploadMultipartFormData(_ url: String,
                    multipartFormData: @escaping (MultipartFormData) -> Void,
                    method: HTTPMethod = .post,
                    headers: HTTPHeaders? = nil) async throws -> Data {
    try await withCheckedThrowingContinuation { continuation in
      session.upload(multipartFormData: multipartFormData,
              to: url,
              method: method,
              headers: headers).responseData { response in
        switch response.result {
        case .success(let data):
          continuation.resume(returning: data)

        case .failure(let error):
          continuation.resume(throwing: error)
        }
      }
    }
  }

  /// Downloads data from the specified URL.
  ///
  /// - Parameters:
  ///  - url: The endpoint URL as a string.
  ///  - method: The HTTP method. Defaults to `.get`.
  ///  - parameters: Optional parameters to be included in the request.
  ///  - headers: Optional headers to be included in the request.
  /// - Returns: The URL of the downloaded file.
  /// - Throws: An error if the request fails.
  public func downloadData(_ url: String,
               method: HTTPMethod = .get,
               parameters: Parameters? = nil,
               headers: HTTPHeaders? = nil) async throws -> URL {
    try await withCheckedThrowingContinuation { continuation in
      session.download(url,
               method: method,
               parameters: parameters,
               headers: headers).responseURL { response in
        switch response.result {
        case .success(let fileURL):
          continuation.resume(returning: fileURL)

        case .failure(let error):
          continuation.resume(throwing: error)
        }
      }
    }
  }
}
