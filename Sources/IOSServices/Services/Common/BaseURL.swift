//
//  File.swift
//  
//
//  Created by Murali moorthy on 8/7/24.
//

import Foundation


/// An enumeration that defines the base URLs used in the application.
public enum BaseURL: String {
    case dev = "https://dev.rgw.calix.ai/map/"
    case devFunc = "https://devfunc-rgw.calix.com/map/"
    case production = "https://rgw.calix.ai/map/"
    case productionCanada = "https://rgw.ca.calix.com/map/"
    case stage = "https://stage.rgw.calix.ai/map/"
    case ssoDev = "https://dev.api.calix.ai/"
    case ssoStage = "https://stage.api.calix.ai/"
    
    static var main: String {
        BaseURL.stage.rawValue
    }
}

/*
var baseURL4 = "https://rgw.ca.calix.com/map/v1/mobile/"
var baseURL1 = "https://rgw.ca.calix.com/map/v2/mobile/" // production
var baseURL2 = "https://rgw.ca.calix.com/map/v3/mobile/"

var baseURL21 = "https://rgw.calix.ai/map/v2/mobile/" // pro
var baseURL22 = "https://rgw.calix.ai/map/v3/mobile/"
var baseURL24 = "https://rgw.calix.ai/map/v1/mobile/"

var baseURL3 = "https://api.calix.ai/v1/subscriber-sso-authentication/" // sso
var baseURL15 = "https://api.calix.ai/v1/subscriber-sso-authentication/"
var baseURL23 = "https://api.calix.ai/v1/subscriber-sso-authentication/"

var baseURL7 = "https://dev.api.calix.ai/v1/subscriber-sso-authentication/"
var baseURL19 = "https://stage.api.calix.ai/v1/subscriber-sso-authentication/"

var baseURL5 = "https://dev.rgw.calix.ai/map/v2/mobile/"
var baseURL6 = "https://dev.rgw.calix.ai/map/v3/mobile/" // dev
var baseURL8 = "https://dev.rgw.calix.ai/map/v1/mobile/"

var baseURL9 = "https://devfunc-rgw.calix.com/map/v2/mobile/"
var baseURL10 = "https://devfunc-rgw.calix.com/map/v3/mobile/" // dev
var baseURL12 = "https://devfunc-rgw.calix.com/map/v1/mobile/"

var baseURL17 = "https://stage.rgw.calix.ai/map/v2/mobile/" //
var baseURL18 = "https://stage.rgw.calix.ai/map/v3/mobile/"
var baseURL20 = "https://stage.rgw.calix.ai/map/v1/mobile/"



*/
