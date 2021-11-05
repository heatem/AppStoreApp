//
//  AppsTableViewCell.swift
//  AppStoreApp
//
//  Created by Heather Mason on 11/1/21.
//

import UIKit

class AppsTableViewCell: UITableViewCell {
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    let appPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    let sellerNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(appNameLabel)
        addSubview(appPriceLabel)
        addSubview(sellerNameLabel)
        installConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installConstraints() {
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        appNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        appNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        appNameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 24).isActive = true
        
        appPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        appPriceLabel.bottomAnchor.constraint(equalTo: appNameLabel.bottomAnchor).isActive = true
        appPriceLabel.leadingAnchor.constraint(equalTo: appNameLabel.trailingAnchor, constant: 16).isActive = true
        appPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        sellerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        sellerNameLabel.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor, constant: 8).isActive = true
        sellerNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        sellerNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        sellerNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
    }
    
    func set(app: App) {
        appNameLabel.text = app.trackName
        appPriceLabel.text = app.formattedPrice
        sellerNameLabel.text = app.sellerName
    }
}
