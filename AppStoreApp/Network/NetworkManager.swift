//
//  NetworkManager.swift
//  AppStoreApp
//
//  Created by Heather Mason on 10/31/21.
//

import Foundation

func getSearchResults(for query: String, completionHandler: @escaping ([App]) -> Void) {
    let urlString = "https://itunes.apple.com/search?entity=software&limit=200&term=\(query)"
    guard let url = URL(string: urlString) else { return }

    let task = URLSession.shared.dataTask(with: url) { data, _, error in
        guard let jsonData = data else {
            print("unable to get app info: \(String(describing: error))")
            return
        }

        do {
            let decoder = JSONDecoder()
            let appsResponse = try decoder.decode(Apps.self, from: jsonData)
            let apps = appsResponse.results
            completionHandler(apps)
        } catch {
            print("decoding failed")
        }
    }
    task.resume()
}

func getImage(from path: String, completionHandler: @escaping (_ data: Data?) -> ()) {
    guard let url = URL(string: path) else { return }
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            print("Error fetching image: \(error)")
            return
        } else {
            completionHandler(data)
        }
    }
    task.resume()
}
