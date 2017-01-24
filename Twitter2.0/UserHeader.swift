//
//  File.swift
//  Twitter2.0
//
//  Created by Ronald Hernandez on 1/22/17.
//  Copyright © 2017 Ronaldoh1. All rights reserved.
//

import LBTAComponents

class UserHeader: DatasourceCell {

   fileprivate let textLabel: UILabel = {
        let label = UILabel()
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()

    override func setupViews() {
        super.setupViews()

        backgroundColor = .white 
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)

        addSubview(textLabel)
        textLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }

}
