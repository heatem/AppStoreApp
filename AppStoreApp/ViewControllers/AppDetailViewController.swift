//
//  AppViewController.swift
//  AppStoreApp
//
//  Created by Heather Mason on 11/4/21.
//

import UIKit

class AppDetailViewController: UIViewController {
    var app = App(
        artworkUrl100: "",
        screenshotUrls: [],
        fileSizeBytes: "",
        formattedPrice: "Free",
        trackId: 0,
        trackName: "",
        sellerName: "",
        description: "",
        genres: [],
        version: "")

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize.height = 1000
        return scrollView
    }()

    let appDetailView = AppDetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = .systemBackground

        if let iconPath = app.artworkUrl100 {
            getImage(from: iconPath) { (imageData) in
                if let data = imageData {
                    DispatchQueue.main.async {
                        self.appDetailView.iconImageView.image = UIImage(data: data)
                    }
                }
            }
        }

        configureAppDetailView()
        configureCollectionView()
        scrollView.contentSize.height = scrollView.contentSize.height
        scrollView.addSubview(appDetailView)
        view.addSubview(scrollView)

        installConstraints()
    }

    func installConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        appDetailView.translatesAutoresizingMaskIntoConstraints = false
        appDetailView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        appDetailView.heightAnchor.constraint(equalToConstant: scrollView.contentSize.height).isActive = true
        appDetailView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        appDetailView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        appDetailView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16).isActive = true
    }

    func configureCollectionView() {
        appDetailView.screenshotsCollectionView.delegate = self
        appDetailView.screenshotsCollectionView.dataSource = self
        appDetailView.screenshotsCollectionView.register(ScreenshotCollectionViewCell.self, forCellWithReuseIdentifier: "ScreenshotCell")
    }

    func configureAppDetailView() {
        appDetailView.nameLabel.text = app.trackName
        appDetailView.priceLabel.text = app.formattedPrice
        appDetailView.versionLabel.text = "Version: \(app.version != nil ? "\(app.version!)" : "")"
        if let fileSize = app.fileSizeBytes, let fileSizeInt = Int(fileSize) {
            appDetailView.sizeLabel.text = "Size: \(fileSizeInt / 1000) KB"
        }
        appDetailView.descriptionLabel.text = app.description
    }
}

extension AppDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return app.screenshotUrls?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = appDetailView.screenshotsCollectionView.dequeueReusableCell(withReuseIdentifier: "ScreenshotCell", for: indexPath) as! ScreenshotCollectionViewCell
        if let screenshotUrl = app.screenshotUrls?[indexPath.item] {
            getImage(from: screenshotUrl) { (imageData) in
                if let data = imageData {
                    DispatchQueue.main.async {
                        cell.screenshotImageView.image = UIImage(data: data)
                    }
                }
            }
        }
        return cell
    }
}
