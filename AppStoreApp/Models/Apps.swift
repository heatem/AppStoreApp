//
//  Apps.swift
//  AppStoreApp
//
//  Created by Heather Mason on 10/30/21.
//

import Foundation

struct Apps: Codable, Hashable {
    let results: [App]
}
//
// TODO: App view should show app name, app icon, description, all screen shots, price, size, version, etc
// TODO: change names to things that make sense in the app. like icon instead of artworkUrl100
// TODO: Clarify all screenshots as in every device? if so, add collections views for each device's screenshots
struct App: Codable, Hashable {
//    let ipadScreenshotUrls: [String]
//    let appletvScreenshotUrls:[String]
//    let artworkUrl60: String
//    let artworkUrl512: String
    let artworkUrl100: String?
//    let artistViewUrl: String
    let screenshotUrls: [String]?
//    let isGameCenterEnabled: Bool
//    let features: [String]
//    let supportedDevices: [String]
//    let advisories: [String]
//    let kind: String
//    let minimumOsVersion: String
//    let trackCensoredName: String
//    let languageCodesISO2A: [String]
    let fileSizeBytes: String?
//    let sellerUrl: String
    let formattedPrice: String?
//    let contentAdvisoryRating: String
//    let averageUserRatingForCurrentVersion: Double
//    let userRatingCountForCurrentVersion: Int
//    let averageUserRating: Double
//    let trackViewUrl: String
//    let trackContentRating: String
//    let bundleId: String
    let trackId: Int
    let trackName: String?
//    let releaseDate: String
    let sellerName: String?
//    let primaryGenreName: String
//    let genreIds: [String]
//    let isVppDeviceBasedLicensingEnabled: Bool
//    let currentVersionReleaseDate: String
//    let releaseNotes: String
//    let primaryGenreId: Int
//    let currency: String
    let description: String?
//    let artistId: Int
//    let artistName: String
//    let genres: [String]
//    let price: Double
    let version: String?
//    let wrapperType: String
//    let userRatingCount: Int
}
