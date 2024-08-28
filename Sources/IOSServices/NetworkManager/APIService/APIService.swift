//
//  APIService.swift
//  CalixIOSService
//
//  Created by Om Prakash Tripathi on 24/06/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import Foundation
/// `APIService` is a class that implements the `APIServiceable` protocol,
///  providing functionality for making network API calls.
///
/// This class serves as the main service layer for interacting with various API endpoints. It handles the logic
/// for sending requests, processing responses, and converting them into models or handling errors as needed.

public class APIService: APIServiceable {
    /**
     Parameter- Dvconfiguration to pass accept header, usertoken etc
     */
    private var configuration: NetworkServiceConfigurable
    private var networkHandler: NetworkHandler

    /**
     - Parameter config: holds the configuration required to prepare the `DVFileBackgroundCreateTask` request
     - Parameter networkTaskExecutor: network task executor to execute PostFileBackground and GetFileBackgroundStatus
     - Parameter retryHandler: If the Token has expired, then the API need to reInitiated
     **/
    public init(configuration: NetworkServiceConfigurable,
                networkHandler: NetworkHandler = NetworkManager()) {
        self.configuration = configuration
        self.networkHandler = networkHandler
    }

    /// Delete Files Function
    /// - Parameters:
    /// - repository: holds repository name
    /// - uris: holds array of the path to one or more files or folders.
    /// - ignoreMissing: If 'true', does not throw 404 error when deleting a non existing file,
    ///   instead it adds an X-Error-Code header to the response with a '8888' value. Defaults to 'false'.
    /// - purge: If 'true', permanently deletes the folder from Digital Vault. Defaults to 'false'.
    ///   Should always be 'true' for files in a group space.
    public func accountLoginService(parameters: RequestParameters?) async throws -> AccountLoginModel {
        let service = AccountLoginService(configuration: configuration,
                                          networkManager: networkHandler)
        return try await service.request(parameters: parameters)
    }

    public func whitelabelInfoService(parameters: RequestParameters?) async throws -> WhitelabelInfoModel {
        let service = WhitelabeInfoService(configuration: configuration,
                                          networkManager: networkHandler)
        return try await service.request(parameters: parameters)
        
    }
    
}
