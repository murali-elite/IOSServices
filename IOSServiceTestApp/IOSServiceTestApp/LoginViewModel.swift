//
//  LoginView.swift
//  IOSServiceTestApp
//
//  Created by Murali moorthy on 8/7/24.
//

import Foundation
import IOSServices


class ViewModel: ObservableObject {
    
    private var service: CalixIOSServisable
    
    init(service: CalixIOSServisable = CalixIOSService()) {
        self.service = service
    }
    
    func sendLoginRequest(email: String, password: String) async throws -> LoginModel? {
        
      //  let bundleID = Bundle.main.bundleIdentifier
        let parameters: [String: Any] = [
            "email": "jessicasmb@calix.com",
            "password": "12345678",
            "mobileDevice": [
                "id": "",
                "notificationToken": "",
                "os": "ios",
                "msisdn": "",
                "locale": "us",
                "packageName": ""
            ]
        ]
        
        return try await service.sendRequest(parameters: parameters)
    }
    
}

