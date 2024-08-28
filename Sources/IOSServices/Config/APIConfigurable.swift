//
//  APIConfigurable.swift
//  CalixIOSService
//
//  Created by Om Prakash Tripathi on 24/06/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import Foundation
/**
 * Protocol that provides the API Configuration details
 */
public protocol APIConfigurable {
    /**
     * Base Url of the API
     */
    var authenticationType: APIAuthenticationType { get }
    /**
     * Base Url of the API
     */
    var baseUrl: String { get }

    /**
     * Application Identifier
     */
    var applicationIdentifier: String { get }

    /**
     * Client Identifier
     */
    var clientIdentifier: String { get }

    /**
     * Client Platform
     */
    var clientPlatform: String { get }

    /**
     * User agent
     */
    var userAgent: String { get }

    /// Returns the base URL for the map service, depending on the specified API version.
    ///
    /// - Parameter version: An `APIVersion` enum value that specifies the version of the API to use.
    /// - Returns: A `String` representing the base URL for the map service corresponding to the given API version.
    func mapBaseUrl(version: APIVersion) -> String

    /// Returns the base URL for the CSC (Customer Service Center) service, depending on the specified API version.
    ///
    /// - Parameter version: An `APIVersion` enum value that specifies the version of the API to use.
    /// - Returns: A `String` representing the base URL for the CSC service corresponding to the given API version.
    func cscBaseUrl(version: APIVersion) -> String

    /// Returns the base URL for the SSO (Single Sign-On) service, depending on the specified API version.
    ///
    /// - Parameter version: An `APIVersion` enum value that specifies the version of the API to use.
    /// - Returns: A `String` representing the base URL for the SSO service corresponding to the given API version.
    func ssoBaseUrl(version: APIVersion) -> String
}
