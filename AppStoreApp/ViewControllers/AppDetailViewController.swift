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
    var app = App(id: 55, trackName: "Demo", artworkUrl100: "https://is5-ssl.mzstatic.com/image/thumb/Purple116/v4/a1/64/d5/a164d515-abef-fe20-da52-a1318242d3f6/source/100x100bb.jpg", description: "generic description", screenshotUrls: ["https://is1-ssl.mzstatic.com/image/thumb/PurpleSource125/v4/2c/a4/bb/2ca4bbfc-0da3-f259-80aa-e3cd3cf6de75/94313b43-8a07-4be8-9eeb-548721eccbca_Apple_Biz_1.jpg/392x696bb.jpg", "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource115/v4/bc/5a/1a/bc5a1ac1-6241-1a93-aa0c-fb4226794f5d/dfb909f9-84b6-4e81-85e0-666269a3cb5a_Apple_Biz_2.jpg/392x696bb.jpg",], fileSizeBytes: 1231231, formattedPrice: "Free", sellerName: "Heather", version: "1.1")
    let scrollView = UIScrollView()
    let appDetailView = AppDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // add data to views
        // TODO: Set up iconImageView
        if let iconPath = app.artworkUrl100 {
            getAppIcon(from: iconPath) { (imageData) in
                if let data = imageData {
                    DispatchQueue.main.async {
                        self.appDetailView.iconImageView.image = UIImage(data: data)
                    }
                }
            }
        }
        
        appDetailView.nameLabel.text = app.trackName
        appDetailView.priceLabel.text = app.formattedPrice
        appDetailView.versionLabel.text = "Version: \(app.version != nil ? "\(app.version!)" : "")"
        // TODO: add a function to convert bytes to KB and MB
        appDetailView.sizeLabel.text = app.fileSizeBytes != nil ? "Size: \(app.fileSizeBytes! / 1000) KB" : ""
        appDetailView.descriptionLabel.text = app.description
        
        // add views
        view.addSubview(scrollView)
        view.addSubview(appDetailView)
        
        installConstraints()
    }
    
    func installConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        appDetailView.translatesAutoresizingMaskIntoConstraints = false
        appDetailView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        appDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        appDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        appDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
