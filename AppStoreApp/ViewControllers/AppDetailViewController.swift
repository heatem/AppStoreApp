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
    var app = App(id: 55, trackName: "Demo", description: "generic description", fileSizeBytes: 1231231, formattedPrice: "Free", sellerName: "Heather", version: 1.1)
    let scrollView = UIScrollView()
    let appDetailView = AppDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add data to views
        // TODO: Set up iconImageView
        appDetailView.nameLabel.text = app.trackName
        appDetailView.priceLabel.text = app.formattedPrice
        appDetailView.versionLabel.text = app.version != nil ? "\(String(describing: app.version))" : ""
        appDetailView.sizeLabel.text = app.fileSizeBytes != nil ? "\(String(describing: app.fileSizeBytes))" : ""
        appDetailView.descriptionLabel.text = description
        
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
