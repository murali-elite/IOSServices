//
//  Authorizing.swift
//  CalixIOSService
//
//  Created by Om Prakash Tripathi on 24/06/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import Foundation
/**
 * Protocol that provides the Authorizing details
 */
public protocol Authorizing {
    /**
     * User ID
     */
    var authToken: String? { get }
    /**
     * User ID
     */
    var userId: String? { get }

    /**
     * Authorized
     */
    var isAuthorized: Bool { get }

    /**
     * update User Id
     */
    func update(userId: String)

    /**
     * authorize request
     */
    func authorize(request: inout URLRequest) throws
}
