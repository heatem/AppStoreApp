//
//  ViewController.swift
//  AppStoreApp
//
//  Created by Heather Mason on 10/30/21.
//

import UIKit

class ViewController: UIViewController {
    let appViewController = AppDetailViewController()

    var allApps: [App]? = []
    var apps: [App]?
    var selectedIndex = 0
    var query = ""
    let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.showsCancelButton = true
        bar.returnKeyType = .search
        return bar
    }()

    let freePaidSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Free", "Paid"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .lightGray
        segmentedControl.selectedSegmentTintColor = .systemBlue
        segmentedControl.addTarget(self, action: #selector(toggleFreePaid), for: .valueChanged)
        return segmentedControl
    }()

    // TODO: filter by genre
    // 1. add the genres for all the apps in the current view (free or paid) to an array.
    // 2. add a stackview with buttons for each filter
    // 3. if a button is pressed, only show apps that have that genre
    var genresSet: Set<String> = []
    var genresStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()

    let appsTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        self.navigationController?.navigationBar.isTranslucent = true
        view.backgroundColor = .systemBackground

        apps = allApps?.filter { $0.formattedPrice == "Free" }

        searchBar.delegate = self

        view.addSubview(searchBar)
        view.addSubview(freePaidSegmentedControl)
        view.addSubview(appsTableView)
        view.addSubview(genresStackView)

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
        
//        genresStackView.translatesAutoresizingMaskIntoConstraints = false
//        genresStackView.topAnchor.constraint(equalTo: freePaidSegmentedControl.bottomAnchor, constant: 4).isActive = true
//        genresStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
//        genresStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true

        appsTableView.translatesAutoresizingMaskIntoConstraints = false
//        appsTableView.topAnchor.constraint(equalTo: genresStackView.bottomAnchor, constant: 4).isActive = true
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
    }
    
    func getGenres() {
        guard let apps = apps else { return }

        var array = [String]()
        for app in apps {
            if let genres = app.genres {
                array += genres
            }
        }
        genresSet = Set(array)
    }
    
    func makeButton(with label: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.titleLabel?.textColor = .black
        button.titleLabel?.text = label
        return button
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {
            return
        }
        title = "Results for: \(query)"

        getSearchResults(for: query) { [weak self] apps in
            self?.allApps = apps
            switch self?.selectedIndex {
            case 0:
                self?.apps = self?.allApps?.filter { $0.formattedPrice == "Free" }
            default:
                self?.apps = self?.allApps?.filter { $0.formattedPrice != "Free" }
            }
            self?.getGenres()
            DispatchQueue.main.async {
                if let genres = self?.genresSet {
                    for genre in genres {
                        self?.genresStackView.addArrangedSubview((self?.makeButton(with: genre))!)
                    }
                }
                self?.appsTableView.reloadData()
            }
        }
        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}

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
