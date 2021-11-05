//
//  AppViewController.swift
//  AppStoreApp
//
//  Created by Heather Mason on 11/4/21.
//

import UIKit

/*
 Approach: Goal is to display AppDetailView
 - add AppDetailView
 - add a scrollview to contain the app detail view
 - in viewDidLoad, set values for the view
 - constrain appDetailView and scrollView
 */

class AppDetailViewController: UIViewController {
    var app = App(
        id: 55,
        trackName: "Demo",
        artworkUrl100: "https://is5-ssl.mzstatic.com/image/thumb/Purple116/v4/a1/64/d5/a164d515-abef-fe20-da52-a1318242d3f6/source/100x100bb.jpg",
        description: "generic description",
        screenshotUrls: [
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource125/v4/2c/a4/bb/2ca4bbfc-0da3-f259-80aa-e3cd3cf6de75/94313b43-8a07-4be8-9eeb-548721eccbca_Apple_Biz_1.jpg/392x696bb.jpg",
            "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource115/v4/bc/5a/1a/bc5a1ac1-6241-1a93-aa0c-fb4226794f5d/dfb909f9-84b6-4e81-85e0-666269a3cb5a_Apple_Biz_2.jpg/392x696bb.jpg",
            "https://is3-ssl.mzstatic.com/image/thumb/Purple126/v4/bf/b7/81/bfb78192-2c42-9592-84a4-36676bfcbdba/4fc5a394-fd7d-45cd-b3a9-306da30f6cd8_iPad_2.jpg/576x768bb.jpg",
            "https://is5-ssl.mzstatic.com/image/thumb/Purple116/v4/37/b4/4b/37b44b6f-a0db-d8d6-0d3a-765b314174e4/febfc3c1-0e73-4fb7-ac25-cc2c6a274de2_iPad_3.jpg/576x768bb.jpg",
            "https://is5-ssl.mzstatic.com/image/thumb/Purple126/v4/b9/c0/40/b9c0404d-651b-df6a-16ea-4cf07a1f35d5/c5986018-facb-4bed-bad3-ef0bd7a6627e_iPad_4.jpg/576x768bb.jpg"
        ],
        fileSizeBytes: 1231231,
        formattedPrice: "Free",
        sellerName: "Not Heather",
        version: "1.1")
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        // TODO: make dynamic
        scrollView.contentSize.height = 1000
        return scrollView
    }()

    let appDetailView = AppDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.backgroundColor = .systemBackground
        // add data to views
        // TODO: Set up iconImageView
        if let iconPath = app.artworkUrl100 {
            getImage(from: iconPath) { (imageData) in
                if let data = imageData {
                    DispatchQueue.main.async {
                        self.appDetailView.iconImageView.image = UIImage(data: data)
                    }
                }
            }
        }
        
        // add views
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
        // TODO: add a function to convert bytes to KB and MB
        appDetailView.sizeLabel.text = app.fileSizeBytes != nil ? "Size: \(app.fileSizeBytes! / 1000) KB" : ""
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
