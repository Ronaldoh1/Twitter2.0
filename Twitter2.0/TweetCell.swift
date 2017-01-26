//
//  TweetCell.swift
//  Twitter2.0
//
//  Created by Ronald Hernandez on 1/24/17.
//  Copyright © 2017 Ronaldoh1. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {

    override var datasourceItem: Any? {
        didSet {
            guard let tweet = datasourceItem as? Tweet else {
                return
            }
            
            let attributedText = NSMutableAttributedString()
            let attributedName = NSAttributedString(string: tweet.user.name, attributes: [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 16)])
            attributedText.append(attributedName)

            let attributedUsername = NSAttributedString(string: "  \(tweet.user.username)\n", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName: UIColor.gray])
            attributedText.append(attributedUsername)

            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4

            let range = NSMakeRange(0, attributedText.string.characters.count)
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)

            let attributedMessage = NSMutableAttributedString(string: tweet.message, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 15)])
            attributedText.append(attributedMessage)



             messageTextView.attributedText = attributedText
        }
    }

    fileprivate let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "joebiden")
        return imageView
    }()

    fileprivate let messageTextView: UITextView = {
        let tv = UITextView()
        tv.text = "Sample Text"
        return tv
    }()


    override func setupViews() {
        super.setupViews()

        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)

        addSubview(profileImage)
        addSubview(messageTextView)
        profileImage.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)

         messageTextView.anchor(self.topAnchor, left: profileImage.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
}
