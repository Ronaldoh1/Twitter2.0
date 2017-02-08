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
    var tweets = [Tweet]()

    required init(json: JSON) throws {

        var users = [User]()

        let array = json["users"].array
        for userJson in array! {
            let user = User(json: userJson)
            users.append(user)
        }

        var tweets = [Tweet]()

        let tweetsJSONArray = json["tweets"].array
        for tweetJson in tweetsJSONArray! {
            let userJson = tweetJson["user"]
            let user = User(json: userJson)
            let message = tweetJson["message"].stringValue
            let tweet = Tweet(user: user, message: message)
            tweets.append(tweet)
        }
        self.users = users
        self.tweets = tweets
    }

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
