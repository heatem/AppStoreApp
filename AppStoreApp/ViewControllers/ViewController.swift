//
//  ViewController.swift
//  AppStoreApp
//
//  Created by Heather Mason on 10/30/21.
//

import UIKit

class ViewController: UIViewController {
    var apps = [App]()
    let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.showsCancelButton = true
        bar.returnKeyType = .search
        return bar
    }()
    
    // TODO: Add tableview to list results
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"

        searchBar.delegate = self

        view.backgroundColor = .blue
        self.navigationController?.navigationBar.isTranslucent = true
        view.addSubview(searchBar)

        addConstraints()
    }

    func addConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
    }
}

extension ViewController: UISearchBarDelegate {
    // add function to get results
    func getResults(from query: String, completionHandler: @escaping ([App]) -> Void) {
        // TODO: add code to get results
        // TODO: move this function to a network folder/file
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text {
            title = "\(query)"
            getResults(from: query) { [weak self] (apps) in
                self?.apps = apps
                // TODO: do try encoding the results to Apps
                // TODO: reload data (on the main thread since it's UI)
            }
            
        }
                    
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}

// TODO: Extend ViewController to conform to UITableview protocols
