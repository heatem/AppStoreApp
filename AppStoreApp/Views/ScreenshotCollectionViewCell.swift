//
//  ScreenshotCollectionViewCell.swift
//  AppStoreApp
//
//  Created by Heather Mason on 11/4/21.
//

import UIKit

class ScreenshotCollectionViewCell: UICollectionViewCell {
    let screenshotImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(screenshotImageView)

        installConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func installConstraints() {
        screenshotImageView.translatesAutoresizingMaskIntoConstraints = false
        screenshotImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        screenshotImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        screenshotImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        screenshotImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
