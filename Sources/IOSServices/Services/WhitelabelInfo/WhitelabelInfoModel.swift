//
//  WhitelabelInfoModel.swift
//
//
//  Created by Murali moorthy on 8/21/24.
//

import Foundation

// MARK: - Welcome
public struct WhitelabelInfoModel: Codable {
    var spID: String?
    var appName: String?
    var appIcon: String?
    var sellerName: String?
    var isActive: Bool?
    var theme: WhitelabelInfoTheme?
    var created: Int?
    var updated: Int?
    var companyName: String?
    var companyAddress: String?
    var supportPhoneNumber: String?
    var supportEmail: String?
    var supportURL: String?
    var billingURL: String?
    var androidDownloadURL: String?
    var iosDownloadURL: String?

    enum CodingKeys: String, CodingKey {
        case spID = "spId"
        case appName = "appName"
        case appIcon = "appIcon"
        case sellerName = "sellerName"
        case isActive = "isActive"
        case theme = "theme"
        case created = "created"
        case updated = "updated"
        case companyName = "companyName"
        case companyAddress = "companyAddress"
        case supportPhoneNumber = "supportPhoneNumber"
        case supportEmail = "supportEmail"
        case supportURL = "supportUrl"
        case billingURL = "billingUrl"
        case androidDownloadURL = "androidDownloadUrl"
        case iosDownloadURL = "iosDownloadUrl"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.spID = try container.decodeIfPresent(String.self, forKey: .spID)
        self.appName = try container.decodeIfPresent(String.self, forKey: .appName)
        self.appIcon = try container.decodeIfPresent(String.self, forKey: .appIcon)
        self.sellerName = try container.decodeIfPresent(String.self, forKey: .sellerName)
        self.isActive = try container.decodeIfPresent(Bool.self, forKey: .isActive)
        self.theme = try container.decodeIfPresent(WhitelabelInfoTheme.self, forKey: .theme)
        self.created = try container.decodeIfPresent(Int.self, forKey: .created)
        self.updated = try container.decodeIfPresent(Int.self, forKey: .updated)
        self.companyName = try container.decodeIfPresent(String.self, forKey: .companyName)
        self.companyAddress = try container.decodeIfPresent(String.self, forKey: .companyAddress)
        self.supportPhoneNumber = try container.decodeIfPresent(String.self, forKey: .supportPhoneNumber)
        self.supportEmail = try container.decodeIfPresent(String.self, forKey: .supportEmail)
        self.supportURL = try container.decodeIfPresent(String.self, forKey: .supportURL)
        self.billingURL = try container.decodeIfPresent(String.self, forKey: .billingURL)
        self.androidDownloadURL = try container.decodeIfPresent(String.self, forKey: .androidDownloadURL)
        self.iosDownloadURL = try container.decodeIfPresent(String.self, forKey: .iosDownloadURL)
    }
}
