//
//  File.swift
//
//
//  Created by Murali moorthy on 8/2/24.
//

import Foundation
import Alamofire

/// A service that handles login requests and interacts with the network.
public struct LoginService: LoginServiceHandler {
    
    /// The network manager used to perform network requests.
    var networkManager: NetworkManager = NetworkManager()

    /// The base URL for the API requests.
    var baseURL: String

    /// The full URL for the login endpoint, constructed from the base URL and the endpoint path.
    ///
    /// - Example: `https://api.example.com/v1/mobile/account/login`
    var url: String {
        BaseURL.main + APIVersion.v1.rawValue + APIAuthentication.mobile.rawValue + APIEndpoints.login.rawValue
    }

    /// The HTTP method used for the request.
    ///
    /// - Example: `.post`
    var method: HTTPMethod

    /// Optional headers to include in the request.
    ///
    /// - Example: `["Content-Type": "application/json"]`
    var headers: HTTPHeaders?

    /// Initializes a new instance of `LoginService` with the specified base URL, HTTP method, and optional headers.
    ///
    /// - Parameters:
    ///   - baseURL: The base URL to use for API requests.
    ///   - method: The HTTP method to use for the request.
    ///   - headers: Optional headers to include in the request.
    public init(baseURL: String,
                method: HTTPMethod,
                headers: HTTPHeaders? = nil) {
        self.baseURL = baseURL
        self.method = method
        self.headers = headers
    }

    /// Sends a login request with the provided parameters and returns a `LoginModel` object.
    ///
    /// - Parameter parameters: The parameters to include in the login request.
    /// - Throws: An error if the request fails or if decoding the response fails.
    /// - Returns: A `LoginModel` object containing the response data.
    public func sendLoginRequest(_ parameters: Parameters) async throws -> LoginModel {
        return try await networkManager.requestDecodable(
            url,
            method: method,
            parameters: parameters,
            headers: headers
        )
    }
}

