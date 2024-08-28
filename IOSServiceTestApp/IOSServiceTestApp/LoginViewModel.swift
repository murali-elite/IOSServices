//
//  LoginView.swift
//  IOSServiceTestApp
//
//  Created by Murali moorthy on 8/7/24.
//

import Foundation
import IOSServices
import Alamofire

class ViewModel: ObservableObject {
    @Published var isShowTapHome: Bool
    @Published var isShowTapPeople: Bool
    
    init() { }
    
    func configureTap() {
        
        isShowTapHome = isTabHome()
        isShowTapPeople = isTabPeople()
    }
    
    func isTabHome() -> Bool {
        return true
    }
    
    func isTabPeople() -> Bool {
        return true
    }
    
}

class VV {
    func bindTabView() {
        ViewModel.isShowTapHome 
    }
}

/*
class LoginModel: LoginModeling {
    let config = AppAssembler.shared.resolve((any NetworkServiceConfigurable).self)
    let apiService = AppAssembler.shared.resolve((any APIServiceable).self)
    let userDefault = AppAssembler.shared.resolve((any UserDefaultsProtocol).self)

    // MARK: - Account Login
    func performLoginService(email: String, password: String) async throws -> (accountLoginModel: AccountLoginModel?,
                                   errorTypeModel: ErrorTypeModel?) {
        let requestParameters = buildLoginRequestParam(email: email, password: password)
        let model = try await apiService?.accountLoginService(parameters: requestParameters)
        
        let errModel = ErrorTypeModel(errorType: model?.errorType, errorDesc: model?.errorDesc)
        
        return (accountLoginModel: model, errorTypeModel: errModel)
    }
    
    private func buildLoginRequestParam(email: String, password: String) -> RequestParameters? {
        guard let config = self.config else {
            return nil
        }
        
        let userDefaults = self.userDefault ?? UserDefaults.standard

        let deviceID = userDefaults.string(forKey: UserDefaultsKeys.deviceId.rawValue) ?? ""
        let fcmToken = userDefaults.string(forKey: UserDefaultsKeys.fcmToken.rawValue) ?? "null"
        
        let bundleID = config.clientIdentifier
        let clientPlatform = config.clientPlatform

        let mobileDevice: [String: Any] = [
            "id": deviceID,
            "notificationToken": fcmToken,
            "os": clientPlatform,
            "msisdn": "",
            "locale": "us",
            "packageName": bundleID
        ]

        let postData: [String: Any] = [
            "email": email,
            "password": password,
            "mobileDevice": mobileDevice
        ]
        
        return postData
    }

    // MARK: - White Label Info
    func performWhitelabelInfoService(spid: String) async throws -> (whitelabelInfoModel: WhitelabelInfoModel?, errorTypeModel: ErrorTypeModel?) {
        let requestParameter = ["spid": spid]
        let model = try await apiService?.whitelabelInfoService(parameters: requestParameter)
        print("Parameter", requestParameter)
        let errorModel = ErrorTypeModel(errorType: model?.errorType, errorDesc: model?.errorDesc)
        return (whitelabelInfoModel: model, errorTypeModel: errorModel)
    }
    
    // MARK: - Setting Locale
    func performSettingLocaleService(locale: String) async throws -> (settingLocaleModel: SettingLocaleModel?, errorTypeModel: ErrorTypeModel?) {
        let requestParameter = ["locale": locale]
        let model = try await apiService?.settingLocaleService(parameters: requestParameter)
        let errorModel = ErrorTypeModel(errorType: model?.errorType, errorDesc: model?.errorDesc)
        return (settingLocaleModel: model, errorTypeModel: errorModel)
    }
    
    // MARK: - Setting Locale
    func performAccountResetService(email: String) async throws -> (accountResetModel: AccountResetModel?, errorTypeModel: ErrorTypeModel?) {
        let requestParameter = ["email": email]
        let model = try await apiService?.accountResetService(parameters: requestParameter)
        let errorModel = ErrorTypeModel(errorType: model?.errorType, errorDesc: model?.errorDesc)
        return (accountResetModel: model, errorTypeModel: errorModel)
    }
    
    

}
*/
