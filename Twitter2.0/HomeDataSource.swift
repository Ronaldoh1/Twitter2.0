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

    var users = [User]()
    var tweets = [Tweet]()

    required init(json: JSON) throws {

        let usersJsonArray = json["users"].array
        self.users = usersJsonArray!.map{ return User(json: $0) }

        let tweetsJSONArray = json["tweets"].array
        self.tweets = tweetsJSONArray!.map { return Tweet(json: $0) }
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
