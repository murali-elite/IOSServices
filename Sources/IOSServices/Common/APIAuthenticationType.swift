//
//  APIAuthenticationType.swift
//  CalixIOSService
//
//  Created by Om Prakash Tripathi on 24/06/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import Foundation

/// An enumeration that defines the types of API authentication methods used in the application.
public enum APIAuthenticationType: String {
    /// Authentication method for mobile applications.
    case mobile = "mobile"

    /// Authentication method for Single Sign-On (SSO) subscribers.
    case ssoSubscriber = "subscriber-sso-authentication"
}
