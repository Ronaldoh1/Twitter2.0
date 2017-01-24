//
//  TweetCell.swift
//  Twitter2.0
//
//  Created by Ronald Hernandez on 1/24/17.
//  Copyright © 2017 Ronaldoh1. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {

    fileprivate let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "joebiden")
        return imageView
    }()


    override func setupViews() {
        super.setupViews()

        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)

        addSubview(profileImage)
        profileImage.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
    }
    
}
