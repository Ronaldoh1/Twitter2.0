//
//  HomeDataSource.swift
//  Twitter2.0
//
//  Created by Ronald Hernandez on 1/22/17.
//  Copyright © 2017 Ronaldoh1. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDataSource: Datasource, JSONDecodable{

    let users: [User]

    required init(json: JSON) throws {

        var users = [User]()

        let array = json["users"].array
        for userJson in array! {
            let name = userJson["name"].stringValue
            let username = userJson["username"].stringValue
            let bio = userJson["bio"].stringValue

            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            users.append(user)
        }
        self.users = users
    }

    let tweets: [Tweet] = {
        let ronUser = User(name: "Ronald Hernandez", username: "@Ronaldoh1", bioText: "Ronald is iOS Developer. He is currently working on learning advanced Swift. He's very excided about iOS Development. He is also a big fan of Dragonball Super. He also likes all of Biden Memes!", profileImage: #imageLiteral(resourceName: "goku"))

        let tweet = Tweet(user: ronUser, message: "Welcome to Episode 9 of Twitter Series. We are doing great so far. I am really liking this series")
        let tweet2 = Tweet(user: ronUser, message: "I am really hungry. I'm going to order some chinese food and watch some dragon ball z.")

        return [tweet]
    }()

    override func numberOfItems(_ section: Int) -> Int {

        if section == 1 {
            return tweets.count
        }

        return users.count
    }

    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 0 {
            return users[indexPath.item]
        }
        
        return tweets[indexPath.item]
    }

    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }

    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }

    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }

    override func numberOfSections() -> Int {
        return 2
    }

}
