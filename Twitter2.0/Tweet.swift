//
//  Tweet.swift
//  Twitter2.0
//
//  Created by Ronald Hernandez on 1/26/17.
//  Copyright © 2017 Ronaldoh1. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {

    let user: User
    let message: String

    init(json: JSON) {
        self.user = User(json: json["user"])
        self.message = json["message"].stringValue
    }
}
