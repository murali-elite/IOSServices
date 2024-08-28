//
//  APIServiceable.swift
//  CalixIOSService
//
//  Created by Om Prakash Tripathi on 24/06/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import Foundation

/// `APIServiceable` is a protocol that defines the necessary functionality for making API service calls.
public protocol APIServiceable {
    /// Asynchronously performs the account login service using the provided parameters.
    ///
    /// - Parameter parameters:
    /// An optional `RequestParameters` dictionary containing the parameters for the login request.
    /// - Returns: An `AccountLoginModel` instance containing the details of the logged-in account.
    /// - Throws: An error if the login process fails, such as network issues or invalid credentials.
    ///
    /// Example usage:
    /// ```swift
    /// do {
    ///     let loginModel =
    ///     try await apiService.accountLoginService(parameters: ["username": "user123", "password": "password123"])
    ///     // Handle successful login
    /// } catch {
    ///     // Handle login error
    /// }
    /// ```
    func accountLoginService(parameters: RequestParameters?) async throws -> AccountLoginModel

    func whitelabelInfoService(parameters: RequestParameters?) async throws -> WhitelabelInfoModel
}
