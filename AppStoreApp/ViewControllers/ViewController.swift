//
//  ViewController.swift
//  AppStoreApp
//
//  Created by Heather Mason on 10/30/21.
//

import UIKit

class ViewController: UIViewController {
    let appViewController = AppDetailViewController()
    
    var allApps: [App]? = [
        App(id: 1, trackName: "first", artworkUrl100: "https://is5-ssl.mzstatic.com/image/thumb/Purple116/v4/a1/64/d5/a164d515-abef-fe20-da52-a1318242d3f6/source/100x100bb.jpg", description: "first app's description", screenshotUrls: [
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource125/v4/2c/a4/bb/2ca4bbfc-0da3-f259-80aa-e3cd3cf6de75/94313b43-8a07-4be8-9eeb-548721eccbca_Apple_Biz_1.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource115/v4/bc/5a/1a/bc5a1ac1-6241-1a93-aa0c-fb4226794f5d/dfb909f9-84b6-4e81-85e0-666269a3cb5a_Apple_Biz_2.jpg/392x696bb.jpg"], fileSizeBytes: 456789, formattedPrice: "$4.99", sellerName: "The Count", version: "1.0"),
        App(id: 2, trackName: "second", artworkUrl100: "https://is5-ssl.mzstatic.com/image/thumb/Purple116/v4/a1/64/d5/a164d515-abef-fe20-da52-a1318242d3f6/source/100x100bb.jpg", description: "second app's description", screenshotUrls: [
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource125/v4/2c/a4/bb/2ca4bbfc-0da3-f259-80aa-e3cd3cf6de75/94313b43-8a07-4be8-9eeb-548721eccbca_Apple_Biz_1.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource115/v4/bc/5a/1a/bc5a1ac1-6241-1a93-aa0c-fb4226794f5d/dfb909f9-84b6-4e81-85e0-666269a3cb5a_Apple_Biz_2.jpg/392x696bb.jpg"], fileSizeBytes: 9876543, formattedPrice: "Free", sellerName: "Dracula", version: "1.1"),
        App(id: 3, trackName: "third", artworkUrl100: "https://is5-ssl.mzstatic.com/image/thumb/Purple116/v4/a1/64/d5/a164d515-abef-fe20-da52-a1318242d3f6/source/100x100bb.jpg", description: "third app's description", screenshotUrls: [
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource125/v4/2c/a4/bb/2ca4bbfc-0da3-f259-80aa-e3cd3cf6de75/94313b43-8a07-4be8-9eeb-548721eccbca_Apple_Biz_1.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource115/v4/bc/5a/1a/bc5a1ac1-6241-1a93-aa0c-fb4226794f5d/dfb909f9-84b6-4e81-85e0-666269a3cb5a_Apple_Biz_2.jpg/392x696bb.jpg"], fileSizeBytes: 7655678, formattedPrice: "$1.99", sellerName: "Muahaha", version: "1.3")
    ]
    var apps: [App]?
    var selectedIndex = 0
    var query = ""
    let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.showsCancelButton = true
        bar.returnKeyType = .search
        return bar
    }()
    
    /*
     TODO: Should toggling filter the results or wait for search to be pressed?
     Consider minimizing calls to the endpoint by filter results by formattedPrice == "Free" or not
     Ask if we should prioritize free/paid in the call or filter results
     */
    
    // TODO: Add segmentedcontrol for free or paid (or both?)
    let freePaidSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Free", "Paid"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .darkGray
        segmentedControl.selectedSegmentTintColor = .systemBlue
        segmentedControl.addTarget(self, action: #selector(toggleFreePaid), for: .valueChanged)
        return segmentedControl
    }()
    
    // TODO: Add filter mechanism for genres
    // Options:
    // 1. handle it as part of the request
    // 2. Use a stackview created with the genre options from the results

    // TODO: Add tableview to list results
    let appsTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        self.navigationController?.navigationBar.isTranslucent = true
        view.backgroundColor = .systemBackground
        
        // TODO: remove once you're pulling in data. Future improvement: use userdefaults to persist selection
        apps = allApps?.filter { $0.formattedPrice == "Free" }

        searchBar.delegate = self

        view.addSubview(searchBar)
        view.addSubview(freePaidSegmentedControl)
        view.addSubview(appsTableView)
        
        configureTableView()
        addConstraints()
    }

    func addConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        freePaidSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        freePaidSegmentedControl.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 4).isActive = true
        freePaidSegmentedControl.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        freePaidSegmentedControl.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        
        appsTableView.translatesAutoresizingMaskIntoConstraints = false
        appsTableView.topAnchor.constraint(equalTo: freePaidSegmentedControl.bottomAnchor, constant: 4).isActive = true
        appsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        appsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        appsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func configureTableView() {
        appsTableView.delegate = self
        appsTableView.dataSource = self
        appsTableView.register(AppsTableViewCell.self, forCellReuseIdentifier: "AppCell")
    }
    
    @objc func toggleFreePaid(_ sender: UISegmentedControl!) {
        selectedIndex = freePaidSegmentedControl.selectedSegmentIndex
        switch selectedIndex {
        case 0:
            apps = allApps?.filter { $0.formattedPrice == "Free" }
        default:
            apps = allApps?.filter { $0.formattedPrice != "Free" }
        }
        appsTableView.reloadData()
        print(selectedIndex)
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.text {
            title = "\(query)"

            // TODO: get search results
        }

        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}

// TODO: Extend ViewController to conform to UITableview protocols
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppCell") as! AppsTableViewCell
        if let appsList = apps {
            let app = appsList[indexPath.row]
            cell.set(app: app)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let app = apps?[indexPath.row] {
            let appDetailViewController = AppDetailViewController()
            appDetailViewController.app = app
            navigationController?.pushViewController(appDetailViewController, animated: true)
        }
    }
}
