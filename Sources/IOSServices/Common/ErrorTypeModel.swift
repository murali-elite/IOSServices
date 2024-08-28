//
//  ErrorTypeModel.swift
//  CalixIOSService
//
//  Created by Om Prakash Tripathi on 24/06/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import Foundation

/// A model representing the response data from a login request.
public struct ErrorTypeModel {
    /// The type of error if the login request fails.
    public var errorType: String?

    /// A description of the error if the login request fails.
    public var errorDesc: String?

    /// Initializes a new instance of the class/struct with optional error information.
    ///
    /// - Parameters:
    ///   - errorType: An optional `String` representing the type of error. Defaults to `nil`.
    ///   - errorDesc: An optional `String` providing a description of the error. Defaults to `nil`.
    ///
    /// Example usage:
    /// ```swift
    /// let errorInstance = MyClass(errorType: "NetworkError", errorDesc: "Failed to connect to the server.")
    /// ```
    ///
    /// If no parameters are provided, both `errorType` and `errorDesc` will be `nil`.
    public init(errorType: String? = nil,
                errorDesc: String? = nil) {
        self.errorType = errorType
        self.errorDesc = errorDesc
    }
}
