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
        tv.backgroundColor = .clear
        return tv
    }()

    fileprivate let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()

    fileprivate let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()

    fileprivate let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()

    fileprivate let directMessage: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()

    override func setupViews() {
        super.setupViews()

        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)

        addSubview(profileImage)
        addSubview(messageTextView)
        profileImage.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)

         messageTextView.anchor(self.topAnchor, left: profileImage.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        setupBottomButtons()
    }

    fileprivate func setupBottomButtons() {

        let replyButtonContainerView = UIView()

        let retweetButtonContainerView = UIView()

        let likeButtonContainerView = UIView()

        let messageContainerView = UIView()

        let buttonStackView = UIStackView(arrangedSubviews: [replyButtonContainerView, retweetButtonContainerView, likeButtonContainerView, messageContainerView])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually

       addSubview(buttonStackView)
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(directMessage)

        buttonStackView.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: 20)

        replyButton.anchor(replyButtonContainerView.topAnchor, left: replyButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)

        retweetButton.anchor(retweetButtonContainerView.topAnchor, left: retweetButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)

        likeButton.anchor(likeButtonContainerView.topAnchor, left: likeButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)

        directMessage.anchor(messageContainerView.topAnchor, left: messageContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
    }
    
}
