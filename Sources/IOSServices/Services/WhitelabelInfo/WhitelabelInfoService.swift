//
//  File.swift
//  
//
//  Created by Murali moorthy on 8/21/24.
//

import Foundation
import Alamofire

// A service that handles login requests and interacts with the network.
public struct WhitelabeInfoService {
    /// The network manager used to perform network requests.
    var networkManager: NetworkHandler = NetworkManager()

    private var configuration: NetworkServiceConfigurable

    private var url: String {
        let baseUrl = configuration.mapBaseUrl(version: .version1)
        let authType = configuration.authenticationType.rawValue
        let endpoint = APIEndpoints.whitelabelInfo.rawValue
        return "\(baseUrl)/\(authType)/\(endpoint)"
    }

    /// The HTTP method used for the request.
    /// - Example: `.post`
    private var method: HTTPMethod = .get

    /// Optional headers to include in the request.
    ///
    /// - Example: `["Content-Type": "application/json"]`
    private var headers: HTTPHeaders? {
        ["Authorization": configuration.authToken ?? ""]
    }

    /// Initializes a new instance of `LoginService` with the specified base URL, HTTP method, and optional headers.
    ///
    /// - Parameters:
    ///   - baseURL: The base URL to use for API requests.
    ///   - method: The HTTP method to use for the request.
    ///   - headers: Optional headers to include in the request.
    public init(configuration: NetworkServiceConfigurable,
                networkManager: NetworkHandler = NetworkManager()) {
        self.configuration = configuration
        self.networkManager = networkManager
    }

    /// Sends a login request with the provided parameters and returns a `LoginModel` object.
    ///
    /// - Parameter parameters: The parameters to include in the login request.
    /// - Throws: An error if the request fails or if decoding the response fails.
    /// - Returns: A `LoginModel` object containing the response data.
    public func request(parameters: RequestParameters? = nil) async throws -> WhitelabelInfoModel {
        try await networkManager.requestDecodable(
            url,
            method: method,
            parameters: parameters,
            headers: headers
        )
    }
}
