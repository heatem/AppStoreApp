//
//  AppsTableViewCell.swift
//  AppStoreApp
//
//  Created by Heather Mason on 11/1/21.
//

import UIKit

let app = App(
    id: 4,
    trackName: "Generic Result",
    artworkUrl100: "https://is5-ssl.mzstatic.com/image/thumb/Purple116/v4/a1/64/d5/a164d515-abef-fe20-da52-a1318242d3f6/source/100x100bb.jpg",
    description: "This is a generic placeholder app description. You should download my app. It's great.",
    screenshotUrls: [
        "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource125/v4/2c/a4/bb/2ca4bbfc-0da3-f259-80aa-e3cd3cf6de75/94313b43-8a07-4be8-9eeb-548721eccbca_Apple_Biz_1.jpg/392x696bb.jpg",
        "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource115/v4/bc/5a/1a/bc5a1ac1-6241-1a93-aa0c-fb4226794f5d/dfb909f9-84b6-4e81-85e0-666269a3cb5a_Apple_Biz_2.jpg/392x696bb.jpg",
        "https://is3-ssl.mzstatic.com/image/thumb/PurpleSource115/v4/12/f5/60/12f560f1-22a2-3580-241d-ea9bb92084cf/1b3d0841-90b7-463e-a973-d0697dfa5ebb_Apple_Biz_3.jpg/392x696bb.jpg",
        "https://is2-ssl.mzstatic.com/image/thumb/PurpleSource115/v4/fe/a9/b7/fea9b78d-da0e-a533-d8b1-9cbdf6e12dfe/5b1ddee3-1b56-45ab-aa17-cca1c37b1063_Apple_Biz_4.jpg/392x696bb.jpg"
    ],
    fileSizeBytes: 81806336,
    formattedPrice: "Free",
    sellerName: "Heather",
    version: "1.0"
)

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
