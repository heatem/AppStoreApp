//
//  AppDetailView.swift
//  AppStoreApp
//
//  Created by Heather Mason on 11/3/21.
//

import UIKit
/*
 Approach:
 - create labels, imageViews, etc for elements that need to be displayed
 - add to view
 - constrain views
 */

class AppDetailView: UIView {
    // app icon
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    // app name
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    // price
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    // version
    let versionLabel: UILabel = {
        let label = UILabel()
        label.text = "Version: "
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    // size
    let sizeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // description
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    // all screen shots
    // TODO: show a collection of screenshots
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // add subviews
        addSubview(iconImageView)
        addSubview(nameLabel)
        addSubview(priceLabel)
        addSubview(versionLabel)
        addSubview(sizeLabel)
        addSubview(descriptionLabel)
        
        installConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installConstraints() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        iconImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor).isActive = true
        
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 16).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        versionLabel.translatesAutoresizingMaskIntoConstraints = false
        versionLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8).isActive = true
        versionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        versionLabel.trailingAnchor.constraint(equalTo: sizeLabel.leadingAnchor, constant: -16).isActive = true
//        versionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        sizeLabel.translatesAutoresizingMaskIntoConstraints = false
        sizeLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8).isActive = true
        sizeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: 16).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
}
