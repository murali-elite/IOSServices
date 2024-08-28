//
//  File.swift
//
//
//  Created by Ranjith Kumar on 25/07/24.
//

import Foundation
import Alamofire

/// Protocol for handling various network requests.
public protocol NetworkHandler {
    /// Performs an HTTP request and returns the response as a JSON object.
    ///
    /// - Parameters:
    ///  - url: The endpoint URL as a string.
    ///  - method: The HTTP method (e.g., GET, POST).
    ///  - parameters: Optional parameters to be included in the request.
    ///  - headers: Optional headers to be included in the request.
    /// - Returns: A JSON object (`Any`).
    /// - Throws: An error if the request fails.
    func requestJSON(
        _ url: String,
        method: HTTPMethod,
        parameters: Parameters?,
        headers: HTTPHeaders?) async throws -> Any

    /// Performs an HTTP request and returns the response as raw data.
    ///
    /// - Parameters:
    ///  - url: The endpoint URL as a string.
    ///  - method: The HTTP method (e.g., GET, POST).
    ///  - parameters: Optional parameters to be included in the request.
    ///  - headers: Optional headers to be included in the request.
    /// - Returns: The response data.
    /// - Throws: An error if the request fails.
    func requestData(
        _ url: String,
        method: HTTPMethod,
        parameters: Parameters?,
        headers: HTTPHeaders?) async throws -> Data

    /// Performs an HTTP request and returns the response as a decodable object.
    ///
    /// - Parameters:
    ///  - url: The endpoint URL as a string.
    ///  - method: The HTTP method (e.g., GET, POST).
    ///  - parameters: Optional parameters to be included in the request.
    ///  - headers: Optional headers to be included in the request.
    /// - Returns: A decodable object of type `T`.
    /// - Throws: An error if the request fails.
    func requestDecodable<T: Decodable>(
        _ url: String,
        method: HTTPMethod,
        parameters: Parameters?,
        headers: HTTPHeaders?) async throws -> T

    /// Uploads data to the specified URL.
    ///
    /// - Parameters:
    ///  - url: The endpoint URL as a string.
    ///  - data: The data to be uploaded.
    ///  - method: The HTTP method (e.g., POST).
    ///  - headers: Optional headers to be included in the request.
    /// - Returns: The response data.
    /// - Throws: An error if the request fails.
    func uploadData(
        _ url: String,
        data: Data,
        method: HTTPMethod,
        headers: HTTPHeaders?) async throws -> Data

    /// Uploads multipart form data to the specified URL.
    ///
    /// - Parameters:
    ///  - url: The endpoint URL as a string.
    ///  - multipartFormData: A closure that appends data to the multipart form data.
    ///  - method: The HTTP method (e.g., POST).
    ///  - headers: Optional headers to be included in the request.
    /// - Returns: The response data.
    /// - Throws: An error if the request fails.
    func uploadMultipartFormData(
        _ url: String,
        multipartFormData: @escaping (MultipartFormData) -> Void,
        method: HTTPMethod,
        headers: HTTPHeaders?) async throws -> Data

    /// Downloads data from the specified URL.
    ///
    /// - Parameters:
    ///  - url: The endpoint URL as a string.
    ///  - method: The HTTP method (e.g., GET).
    ///  - parameters: Optional parameters to be included in the request.
    ///  - headers: Optional headers to be included in the request.
    /// - Returns: The URL of the downloaded file.
    /// - Throws: An error if the request fails.
    func downloadData(
        _ url: String,
        method: HTTPMethod,
        parameters: Parameters?,
        headers: HTTPHeaders?) async throws -> URL
}
