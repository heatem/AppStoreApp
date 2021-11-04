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
struct App: Codable, Identifiable, Hashable {
    let id: Int // trackId
    let trackName: String? // trackName
    let artworkUrl100: String? // artworkUrl60, artworkUrl512, artworkUrl100
    let description: String? // description
    let screenshotUrls: [String]? // screenshotUrls
//// TODO: Do i need to show appleTV/ipad screenshots?
//    let price: Float // price
    let fileSizeBytes: Int? // fileSizeBytes
    let formattedPrice: String? // formattedPrice
//    let advisoryRating: String // contentAdvisoryRating
//    let releaseDate: String // releaseDate
    let sellerName: String? // sellerName
//    let primaryGenreName: String // primaryGenreName
//    let averageUserRatingForCurrentVersion: Float // averageUserRatingForCurrentVersion
//    let userRatingForCurrentVersion: Int // userRatingCountForCurrentVersion
//    let averageUserRating: Float // averageUserRating
//    let genres: [String] // genres
//    let artistId: Int // artistId
//    let artistName: String? // artistName
    let version: String? // version
}
