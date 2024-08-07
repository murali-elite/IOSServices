//
//  File.swift
//  
//
//  Created by Murali moorthy on 8/2/24.
//

import Foundation

/// A model representing the response data from a login request.
public struct LoginModel: Decodable {
    
    /// The type of error if the login request fails.
    public var errorType: String?
    
    /// A description of the error if the login request fails.
    public var errorDesc: String?
    
    /// The authentication token received upon successful login.
    public var token: String?
    
    /// The unique identifier for the user.
    public var userId: String?
    
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
}
