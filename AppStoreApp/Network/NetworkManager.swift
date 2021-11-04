//
//  NetworkManager.swift
//  AppStoreApp
//
//  Created by Heather Mason on 10/31/21.
//

import Foundation

func getSearchResults(for query: String, completionHandler: @escaping ([App]) -> Void) {
    let url = URL(string: "https://itunes.apple.com/search?entity=software&limit=200&term=\(query)")
    
    guard let validUrl = url else { return }
    
    let task = URLSession.shared.dataTask(with: validUrl, completionHandler: { (data, response, error) in
        if let error = error {
            print("Error fetching list: \(error)")
            return
        }
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            print("Unexpected status code: \(String(describing: response))")
            return
        }
        
        if let data = data {
            print("got data", data)
            if let apps = try? JSONDecoder().decode(Apps.self, from: data) {
                print("this works")
                completionHandler(apps.results)
            }
        }
        print("nothing happened")
    })
    
    task.resume()

    // TODO: handle free/paid sort. modify function this is called in to account for free/paid added to query that's passed here
//    if selectedIndex == 0 {
//        urlString.append("&formattedPrice=Free")
//    } else {
//        urlString = urlString.replacingOccurrences(of: "&formattedPrice=Free", with: "")
//    }
    
    // TODO: add code to get results
//    do {
   //                    let encoder = JSONEncoder()
   //                    let data = try encoder.encode(apps)
   //                    print()
   //                } catch {
   //                    // TODO: replace with something more useful for users?
   //                    print("error encoding apps: \(error)")
   //                }
//    
//    func getTrack(_ term: String, onCompletion: @escaping CompletedOperation) {
//            let term = term.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//            let urlString = "https://itunes.apple.com/search?term=\(term!)"
//            
//            let taks = URLSession.shared.dataTask(with: URL(string: urlString)!) { (data: Data?, response: URLResponse?, error: Error?) in
//                
//                do {
//                    let jsonResponse
//                        = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any]
//                    
//                    onCompletion(jsonResponse)
//                }catch (_) {
//                    onCompletion(nil)
//                }
//            }
//            
//            taks.resume()
//        }
//    
}
