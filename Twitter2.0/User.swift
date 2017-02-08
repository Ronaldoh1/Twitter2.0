//
//  User.swift
//  Twitter2.0
//
//  Created by Ronald Hernandez on 1/23/17.
//  Copyright © 2017 Ronaldoh1. All rights reserved.
//
import UIKit
import SwiftyJSON

struct User {

    let name: String
    let username: String
    let bioText: String
    let profileImage: UIImage

    init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImage = UIImage()
    }

}
