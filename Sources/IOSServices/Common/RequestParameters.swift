//
//  RequestParameters.swift
//  CalixIOSService
//
//  Created by Om Prakash Tripathi on 24/06/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import Foundation

/// `RequestParameters` is a typealias for a dictionary used to represent parameters in a network request.
/// The dictionary keys are of type `String`, typically representing parameter names,
/// and the values are of type `Any`,
/// allowing for flexibility in the type of data that can be passed (e.g., strings, numbers, arrays, etc.).
///
/// Example usage:
/// ```swift
/// let parameters: RequestParameters = [
///     "username": "user123",
///     "password": "securepassword",
///     "age": 30,
///     "features": ["feature1", "feature2"]
/// ]
/// ```
public typealias RequestParameters = [String: Any]
