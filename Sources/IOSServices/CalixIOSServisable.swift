//
//  File.swift
//  
//
//  Created by Murali moorthy on 8/7/24.
//

import Foundation
import Alamofire

/// A protocol that defines the contract for services that handle Calix iOS API requests.
public protocol CalixIOSServisable {
    /// Sends a request with the given parameters and returns a `LoginModel` object.
    ///
    /// - Parameter parameters: The parameters to include in the request.
    /// - Throws: An error if the request fails or if decoding the response fails.
    /// - Returns: A `LoginModel` object containing the response data.
    func sendRequest(parameters: Parameters) async throws -> LoginModel
}
