//
//  APIEndpoints.swift
//  CalixIOSService
//
//  Created by Om Prakash Tripathi on 24/06/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import Foundation

/// `APIEndpoints` defines the string values for various API endpoint paths used in network requests.
public enum APIEndpoints: String {
    /// The endpoint for logging in to the account.
    case accountLogin = "account/login"
    
    case whitelabelInfo = "whitelabel/info"

    /// The endpoint for adding a satellite to the router.
    case routerSatelliteAdd = "router/satellite/add"

    /// The endpoint for retrieving WPS (Wi-Fi Protected Setup) information.
    case wpsGet = "wps/get"

    /// The endpoint for managing secondary account information.
    case accountSecondary = "account/secondary"

    /// The endpoint for retrieving the primary SSID (Service Set Identifier) of the router.
    case routerSSIDPrimary = "router/ssid/primary"

    /// The endpoint for updating the primary SSID of the router.
    case routerSSIDPrimaryUpdate = "router/ssid/primary/update"

    /// The endpoint for resetting the account.
    case accountReset = "account/reset"

    /// The endpoint for sending secure onboarding data to the router.
    case routerSecureOnboardingSend = "router/secure/onboarding/send"

    /// The endpoint for starting WPS (Wi-Fi Protected Setup).
    case wpsStart = "wps/start"

    /// The endpoint for retrieving the router map.
    case routerMap = "router/map"

    /// The endpoint for syncing data.
    case syncData = "sync/data"

    /// The endpoint for adding a new account.
    case accountAdd = "account/add"

    /// The endpoint for adding an entry to the security log's allowlist.
    case securityLogAllowlistAdd = "security/log/allowlist/add"

    /// The endpoint for retrieving the dashboard information.
    case dashboard = "dashboard"

    /// The endpoint for uninstalling an application.
    case applicationUninstall = "application/uninstall"

    /// The endpoint for installing an application.
    case applicationInstall = "application/install"

    /// The endpoint for updating the secondary network of the router.
    case routerWifiSecondaryNetworkUpdate = "router/wifi/secondarynetwork/update"

    /// The endpoint for adding a secondary network to the router.
    case routerWifiSecondaryNetworkAdd = "router/wifi/secondarynetwork/add"

    /// The endpoint for adding a guest network to the router.
    case routerGuestAdd = "router/guest/add"

    /// The endpoint for updating the guest network on the router.
    case routerGuestUpdate = "router/guest/update"

    /// The endpoint for deleting the guest network from the router.
    case routerGuestDelete = "router/guest/delete"

    /// The endpoint for blocking a persona (user).
    case personaBlock = "persona/block"

    /// The endpoint for unblocking a persona (user).
    case personaUnblock = "persona/unblock"

    /// The endpoint for connecting a device.
    case deviceConnect = "device/connect"

    /// The endpoint for disconnecting a device.
    case deviceDisconnect = "device/disconnect"

    /// The endpoint for retrieving a list of devices based on a filter.
    case deviceListByFilter = "device/listByFilter"

    /// The endpoint for renaming a device.
    case deviceRename = "device/rename"

    /// The endpoint for marking a notification as read.
    case notificationRead = "notification/read"

    /// The endpoint for retrieving notifications.
    case notification = "notification"

    /// The endpoint for sending factory information to the router.
    case routerFactoryInfoSend = "router/factoryinfo/send"

    /// The endpoint for updating the router.
    case routerUpdate = "router/update"

    /// The endpoint for retrieving a list of IoT devices.
    case iotList = "iot/list?"

    /// The endpoint for updating a device.
    case deviceUpdate = "device/update"

    /// The endpoint for updating the application token.
    case applicationTokenUpdate = "application/token/update"

    /// The endpoint for updating the account password.
    case accountPasswordUpdate = "account/password/update"

    /// The endpoint for retrieving a list of devices.
    case deviceList = "device/list"

    /// The endpoint for retrieving a list of personas (users).
    case personaList = "persona/list"

    /// The endpoint for removing a persona (user).
    case personaRemove = "persona/remove"

    /// The endpoint for adding a station to a persona (user).
    case personaStationAdd = "persona/station/add"

    /// The endpoint for removing a station from a persona (user).
    case personaStationRemove = "persona/station/remove"

    /// The endpoint for editing the name in parental control settings.
    case parentControlEditName = "parentcontrol/edit"

    /// The endpoint for updating a place.
    case placeUpdate = "place/update"

    /// The endpoint for searching for apps in parental control settings.
    case parentControlAppSearch = "parentcontrol/app/search?"

    /// The endpoint for searching for default apps in parental control settings.
    case parentControlDefaultAppSearch = "parentcontrol/default/app/search?keyword"

    /// The endpoint for adding parental controls.
    case parentControlAdd = "parentcontrol/add"

    /// The endpoint for managing apps in parental control settings.
    case parentControlApp = "parentcontrol/app"

    /// The endpoint for managing default apps in parental control settings.
    case parentControlDefaultApp = "parentcontrol/default/app"

    /// The endpoint for updating the account.
    case accountUpdate = "account/update"

    /// The endpoint for retrieving usage information related to the router in parental control settings.
    case parentControlUsageRouter = "parentcontrol/usage/router"

    /// The endpoint for retrieving profile summary in parental control settings.
    case parentControlProfileSummary = "parentcontrol/profile/summary"

    /// The endpoint for setting multiple bedtimes in parental control settings.
    case parentControlBedtimeMultipleSet = "parentcontrol/bedtime/multiple/set"

    /// The endpoint for setting multiple bedtimes for a persona (user).
    case personaBedtimeMultipleSet = "persona/bedtime/multiple/set"

    /// The endpoint for setting multiple bedtimes for all personas in parental control settings.
    case parentControlBedtimeMultipleSetAll = "parentcontrol/bedtime/multiple/setall"

    /// The endpoint for setting multiple bedtimes for all personas.
    case personaBedtimeMultipleSetAll = "persona/bedtime/multiple/setall"

    /// The endpoint for removing multiple bedtimes in parental control settings.
    case parentControlBedtimeMultipleRemove = "parentcontrol/bedtime/multiple/remove"

    /// The endpoint for removing multiple bedtimes for a persona (user).
    case personaBedtimeMultipleRemove = "persona/bedtime/multiple/remove"

    /// The endpoint for removing the router.
    case routerRemove = "router/remove"

    /// The endpoint for retrieving the usage history of a device.
    case deviceUsageHistory = "device/usage/history"

    /// The endpoint for removing parental controls.
    case parentControlRemove = "parentcontrol/remove"

    /// The endpoint for adding a web entry to parental control settings.
    case parentControlWebAdd = "parentcontrol/web/add"

    /// The endpoint for adding a default web entry to parental control settings.
    case parentControlDefaultWebAdd = "parentcontrol/default/web/add"

    /// The endpoint for retrieving a list of stations for a persona (user).
    case personaStationList = "persona/station/list"

    /// The endpoint for checking feature availability.
    case featureAvailability = "feature/availability"

    /// The endpoint for updating the account email.
    case accountEmailUpdate = "account/email/update"

    /// The endpoint for adding a QoS (Quality of Service) profile.
    case qosProfileAdd = "qos/profile/add"

    /// The endpoint for updating a QoS (Quality of Service) profile.
    case qosProfileUpdate = "qos/profile/update"

    /// The endpoint for activating QoS (Quality of Service).
    case qosActivate = "qos/activate"

    /// The endpoint for deactivating QoS (Quality of Service).
    case qosDeactivate = "qos/deactivate"

    /// The endpoint for updating a QoS (Quality of Service) device.
    case qosDeviceUpdate = "qos/device/update"
}
