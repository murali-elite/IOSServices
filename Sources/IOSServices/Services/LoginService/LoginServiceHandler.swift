//
//  File.swift
//  
//
//  Created by Murali moorthy on 8/2/24.
//

import Foundation
import SwiftUI
import Alamofire

/// A protocol that defines the contract for handling login requests in a service.
public protocol LoginServiceHandler {
    /// Sends a login request with the given parameters and returns a `LoginModel` object.
    ///
    /// - Parameter parameters: The parameters to include in the login request.
    /// - Throws: An error if the request fails or if decoding the response fails.
    /// - Returns: A `LoginModel` object containing the response data.
    func sendLoginRequest(_ parameters: Parameters) async throws -> LoginModel
}
