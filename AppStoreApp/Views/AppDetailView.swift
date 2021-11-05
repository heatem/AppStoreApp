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
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.gray.cgColor
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
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    // version
    let versionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        return label
    }()
    
    // size
    let sizeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
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
    let screenshotsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.itemSize = CGSize(width: 144, height: 192)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // add subviews
        addSubview(iconImageView)
        addSubview(nameLabel)
        addSubview(priceLabel)
        addSubview(versionLabel)
        addSubview(sizeLabel)
        addSubview(descriptionLabel)
        addSubview(screenshotsCollectionView)
        
        installConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installConstraints() {
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
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
        sizeLabel.bottomAnchor.constraint(equalTo: versionLabel.bottomAnchor).isActive = true
        sizeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: 16).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        screenshotsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        screenshotsCollectionView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16).isActive = true
        screenshotsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        screenshotsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        screenshotsCollectionView.heightAnchor.constraint(equalToConstant: 192).isActive = true
    }
}
