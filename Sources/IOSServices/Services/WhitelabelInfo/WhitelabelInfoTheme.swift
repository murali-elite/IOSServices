//
//  File.swift
//  
//
//  Created by Murali moorthy on 8/21/24.
//

import Foundation

// MARK: - Theme
public struct WhitelabelInfoTheme: Codable {
    var primaryColor: String?
    var secondaryColor: String?
    var logo: String?

    enum CodingKeys: String, CodingKey {
        case primaryColor = "primaryColor"
        case secondaryColor = "secondaryColor"
        case logo = "logo"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.primaryColor = try container.decodeIfPresent(String.self, forKey: .primaryColor)
        self.secondaryColor = try container.decodeIfPresent(String.self, forKey: .secondaryColor)
        self.logo = try container.decodeIfPresent(String.self, forKey: .logo)
    }
}
