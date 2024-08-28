//
//  AccountLoginModel.swift
//  CalixIOSService
//
//  Created by Om Prakash Tripathi on 24/06/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//
import Foundation
/// A model representing the response data from a login request.
public struct AccountLoginModel: Codable {
    enum CodingKeys: CodingKey {
        case errorType
        case errorDesc
        case token
        case userId
        case deviceId
        case firstName
        case lastName
        case email
        case spid
        case locale
        case referrer
        case routerOnboardedCounter
    }

    /// The type of error if the login request fails.
    public var errorType: String?

    /// A description of the error if the login request fails.
    public var errorDesc: String?

    /// The authentication token received upon successful login.
    public var token: String?

    /// The unique identifier for the user.
    public var userId: String?
    /// The unique identifier for the user.
    public var deviceId: String?

    /// The user's first name.
    public var firstName: String?

    /// The user's last name.
    public var lastName: String?

    /// The user's email address.
    public var email: String?

    /// A service provider ID, if applicable.
    public var spid: String?

    /// The locale of the user.
    public var locale: String?

    /// The referrer information, if applicable.
    public var referrer: String?

    /// The count of router onboarding steps completed by the user.
    public var routerOnboardedCounter: Int?

    /// Initializes a new instance of the class/struct by decoding data from the provided decoder.
    /// This initializer is typically used to conform to the `Decodable` protocol,
    /// allowing the instance to be created from external data formats such as JSON.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.errorType = try container.decodeIfPresent(String.self, forKey: .errorType)
        self.errorDesc = try container.decodeIfPresent(String.self, forKey: .errorDesc)
        self.token = try container.decodeIfPresent(String.self, forKey: .token)
        self.userId = try container.decodeIfPresent(String.self, forKey: .userId)
        self.userId = try container.decodeIfPresent(String.self, forKey: .deviceId)
        self.firstName = try container.decodeIfPresent(String.self, forKey: .firstName)
        self.lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.spid = try container.decodeIfPresent(String.self, forKey: .spid)
        self.locale = try container.decodeIfPresent(String.self, forKey: .locale)
        self.referrer = try container.decodeIfPresent(String.self, forKey: .referrer)
        self.routerOnboardedCounter = try container.decodeIfPresent(Int.self, forKey: .routerOnboardedCounter)
    }
}
