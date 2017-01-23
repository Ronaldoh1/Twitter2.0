//
//  WordCell.swift
//  Twitter2.0
//
//  Created by Ronald Hernandez on 1/17/17.
//  Copyright © 2017 Ronaldoh1. All rights reserved.
//

import UIKit

class WordCell: UICollectionViewCell {

   private let wordLabel: UILabel = {
        let label = UILabel()
        label.text = "Test Test Test"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .yellow
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Private Functions

    private func setUpViews() {
        addSubview(wordLabel)

        wordLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        wordLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        wordLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        wordLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
}
