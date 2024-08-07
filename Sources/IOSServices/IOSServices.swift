// The Swift Programming Language
// https://docs.swift.org/swift-book


import Foundation
import Alamofire


/// A service class that handles API requests related to Calix iOS services.
public class CalixIOSService: CalixIOSServisable {
    
    /// A computed property for creating `LoginService` with the current base URL and HTTP method.
    private var loginService: LoginService {
        LoginService(baseURL: BaseURL.main, method: .post)
    }
    
    public init() { }

    /// Sends a login request with the provided parameters.
    ///
    /// - Parameter parameters: The parameters to include in the login request.
    /// - Throws: An error if the request fails or if decoding the response fails.
    /// - Returns: A `LoginModel` object containing the response data.
    public func sendRequest(parameters: Parameters) async throws -> LoginModel {
        try await loginService.sendLoginRequest(parameters)
    }
}
